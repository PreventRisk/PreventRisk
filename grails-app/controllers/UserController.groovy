

class  UserController {

    def registro() {
        if(request.method == 'POST') {
            def u = new User()
            u.properties['login', 'password', 'firstName', 'lastName'] = params
            if(u.password != params.confirm) {
                u.errors.rejectValue("password", "user.password.dontmatch")
                return [user:u]
            } else if(u.save()) {
                session.user = u
                //render("usuario creado")
                redirect controller:"home"
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

    def login= {
    }


    def logout() {
        if(session.user) {
            session.user = null
            session.invalidate()
            render("ha salido de la aplicacion")
            //redirect(controller:'home')
        }
    }
}
