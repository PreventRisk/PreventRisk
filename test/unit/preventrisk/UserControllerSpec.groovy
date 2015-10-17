package preventrisk

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(UserController)
class UserControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }
    void testPasswordsDoNotMatch() {
        request.method = 'POST'
        params.login = 'usuario'
        params.password = 'password'
        params.confirm = 'wrongPassword'
        params.firstName = 'Henry'
        params.lastName = 'Rollins'
        def model = controller.register()
        def user = model.user
        assert user.hasErrors()
        assert 'user.password.dontmatch' ==
                user.errors['password'].code
    }
}
