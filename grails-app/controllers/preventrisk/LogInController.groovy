/**
 * Created by Carlos on 12/10/2015.
 */

package preventrisk

class LogInController{

    def current = {
        def allLogIns = LogIn.list()
        [allLogIns : allLogIns]
    }


}