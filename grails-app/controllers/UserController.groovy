
class  UserController {


    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def registro() {
        if(request.method == 'POST') {
            def u = new User()
            u.properties['login', 'password', 'firstName', 'lastName'] = params
            if(u.password != params.confirm) {
                u.errors.rejectValue("password", "user.password.dontmatch")
                return [user:u]
            } else if(u.save()) {
                session.user = u
                  redirect controller:"home"
            } else {
                u.errors.each {
                    flash.message= it
                }
                return [user:u]
            }
        }
    }



    def dologin(LoginCommand cmd) {
        if(request.method == 'POST') {
            def user = cmd.getUser()
            if(!cmd.hasErrors()) {
                session.user = user
                redirect controller:'home'
            }else{
                def u= User.findByLogin(params.login)
                if(!u){
                    flash.message="No se encuentra el usuario: ${params.login}"
                    redirect(controller:'user',action:'login')
                }else{
                    flash.message="La contraseña es incorrecta"
                    redirect(controller:'user',action:'login')
                }
            }
        } else {
            redirect(controller:'user',action:'login')
        }
    }
    def dologinfromsim(LoginCommand cmd) {
        if(request.method == 'POST') {
            def user = cmd.getUser()
            if(!cmd.hasErrors()) {
                session.user = user
                redirect (controller:'emergency', action:'emergencyType')
            }else{
                def u= User.findByLogin(params.login)
                if(!u){
                    flash.message="No se encuentra el usuario: ${params.login}"
                    redirect(controller:'user',action:'login')
                }else{
                    flash.message="La contraseña es incorrecta"
                    redirect(controller:'user',action:'login')
                }
            }
        } else {
            redirect(controller:'user',action:'login')
        }
    }

    def login= {
    }

    def modify={

    }

    def doModify() {
        def u = User.get(session.user.id)
        if (params.firstName=='' || params.lastName==''){
            flash.message= "Los nuevos datos no pueden ser vacíos"
            redirect(controller:'user',action:'modify')
        }else{
            if (u.password == params.vieja) {
                if (params.password != params.confirm) {
                    flash.message = "Las nuevas contraseñas no coinciden"
                    redirect(controller:'user',action:'modify')
                }else {
                    u.firstName = params.firstName
                    u.lastName = params.lastName
                    u.password= params.confirm
                    if (!u.validate()){
                        flash.message= "La nueva contraseña debe contener al menos 5 caracteres"
                        redirect(controller:'user',action:'modify')
                    }else{
                        u.save(flush: true)
                        session.user = u
                        redirect(controller: 'home')
                    }
                }
            }
            else {
                flash.message = "La contraseña anterior es incorrecta"
                redirect(controller:'user',action:'modify')
            }
        }
    }

    def doDelete(){
        def u = User.get(session.user.id)
        if (u.password == params.vieja) {
            u.delete(flush: true)
            session.user = null
            session.invalidate()
            redirect(controller: 'home')
        }else {
            redirect(controller:'user',action:'modify')
            flash.message = "La contraseña es incorrecta"
            }
    }

    def logout() {
        if(session.user) {
            session.user = null
            session.invalidate()
            redirect(controller:'home')
        }
    }
}
