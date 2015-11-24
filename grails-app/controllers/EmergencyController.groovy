import static org.springframework.http.HttpStatus.*
import groovy.sql.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EmergencyController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def emergencySelected = []
    def relations = []

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Emergency.list(params), model: [emergencyInstanceCount: Emergency.count()]
    }

    def show(Emergency emergencyInstance) {
        respond emergencyInstance
    }

    def create() {
//        respond new Emergency(params)
    }

    def answer() {

    }

    def emergencyType(){

    }

    def selectType(String id){
        emergencySelected = []
        def emergencies = Emergency.list()
        [emergencies: emergencies]
        emergencies.each {
            if (it.type == id) emergencySelected.add(it.id)
        }
        println emergencySelected
    }



    def question(){

    }

    @Transactional
    def save(Emergency emergencyInstance) {
        if (emergencyInstance == null) {
            notFound()
            return
        }

        if (emergencyInstance.hasErrors()) {
            respond emergencyInstance.errors, view: 'create'
            return
        }

        emergencyInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'emergency.label', default: 'Emergency'), emergencyInstance.id])
                redirect emergencyInstance
            }
            '*' { respond emergencyInstance, [status: CREATED] }
        }
    }

    def edit(Emergency emergencyInstance) {
        respond emergencyInstance
    }

    @Transactional
    def update(Emergency emergencyInstance) {
        if (emergencyInstance == null) {
            notFound()
            return
        }

        if (emergencyInstance.hasErrors()) {
            respond emergencyInstance.errors, view: 'edit'
            return
        }

        emergencyInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Emergency.label', default: 'Emergency'), emergencyInstance.id])
                redirect emergencyInstance
            }
            '*' { respond emergencyInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Emergency emergencyInstance) {

        if (emergencyInstance == null) {
            notFound()
            return
        }

        emergencyInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Emergency.label', default: 'Emergency'), emergencyInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'emergency.label', default: 'Emergency'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
