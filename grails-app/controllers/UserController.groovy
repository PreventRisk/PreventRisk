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
                render("usuario creado")
                //  redirect controller:"home"
            } else {
                return [user:u]
            }
        }
    }



    def dologin(LoginCommand cmd) {
        if(request.method == 'POST') {
            def user = cmd.getUser()
            if(!cmd.hasErrors()) {
                session.user = user
                // render("se acepto el login")
                // flash.message = "Hello ${user.login}!"
                redirect controller:'home'
            } else {
                redirect(controller:'user',action:'login')
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
                // render("se acepto el login")
                // flash.message = "Hello ${user.login}!"
                redirect (controller:'emergency', action:'emergencyType')
            } else {
                redirect(controller:'user',action:'login')
            }
        } else {
            redirect(controller:'user',action:'login')
        }
    }

    def login= {
    }
    def loginfromsimulator = {

    }

    def modify={

    }

    def doModify() {
        def u = User.findByLogin(params.login)
        if (u==null){
            redirect(controller:'user',action:'modify')
        }else{
        if (u.password == params.vieja) {
            if (params.password != params.confirm) {
            flash.message = "Las nuevas contraseñas no coinciden"
            redirect(controller:'user',action:'modify')
            } else {
                u.firstName = params.firstName
                u.lastName = params.lastName
                u.password= params.confirm
                u.save(flush: true)
                session.user = u
                redirect(controller: 'home')
            }
        } else {
             redirect(controller:'user',action:'modify')
             flash.message = "La contraseña anterior es incorrecta"
            }
    }}








    def logout() {
        if(session.user) {
            session.user = null
            session.invalidate()
            //render("ha salido de la aplicacion")
            redirect(controller:'home')
        }
    }
}
