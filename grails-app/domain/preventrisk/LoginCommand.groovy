package preventrisk

/**
 * Created by monica on 16/10/15.
 */
class LoginCommand {
    String login
    String password
    private u
    User getUser() {
        if(!u && login) {
            u = User.findByLogin(login)
        }
        return u
    }
    static constraints = {
        login blank:false, validator:{ val, obj ->
            if(!obj.user)
                return "user.not.found"
        }
        password blank:false, password: true , validator:{ val, obj ->
            if(obj.user && obj.user.password != val)
                return "user.password.invalid"
        }
    }
}
