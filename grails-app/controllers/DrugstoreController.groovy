import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DrugstoreController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Drugstore.list(params), model: [drugstoreInstanceCount: Drugstore.count()]
    }

    def show(Drugstore drugstoreInstance) {
        respond drugstoreInstance
    }

    def create() {
        respond new Drugstore(params)
    }

    @Transactional
    def save(Drugstore drugstoreInstance) {
        if (drugstoreInstance == null) {
            notFound()
            return
        }

        if (drugstoreInstance.hasErrors()) {
            respond drugstoreInstance.errors, view: 'create'
            return
        }

        drugstoreInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'drugstore.label', default: 'Drugstore'), drugstoreInstance.id])
                redirect drugstoreInstance
            }
            '*' { respond drugstoreInstance, [status: CREATED] }
        }
    }

    def edit(Drugstore drugstoreInstance) {
        respond drugstoreInstance
    }

    @Transactional
    def update(Drugstore drugstoreInstance) {
        if (drugstoreInstance == null) {
            notFound()
            return
        }

        if (drugstoreInstance.hasErrors()) {
            respond drugstoreInstance.errors, view: 'edit'
            return
        }

        drugstoreInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Drugstore.label', default: 'Drugstore'), drugstoreInstance.id])
                redirect drugstoreInstance
            }
            '*' { respond drugstoreInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Drugstore drugstoreInstance) {

        if (drugstoreInstance == null) {
            notFound()
            return
        }

        drugstoreInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Drugstore.label', default: 'Drugstore'), drugstoreInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'drugstore.label', default: 'Drugstore'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
