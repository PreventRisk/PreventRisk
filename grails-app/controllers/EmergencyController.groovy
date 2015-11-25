import static org.springframework.http.HttpStatus.*
import groovy.sql.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EmergencyController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def emergencySelected = []
    def emergency_symptoms = [1:[1,2,3,4,5,6,7,8,9,12], 2:[13,14,16,17,18,34,20,19,15], 3:[21,24,34], 4:[21,26], 5:[5,14,28,30,9,12,31], 6:[34], 7:[16,37,6,38,20,24,9], 8:[39,23,40,41,42], 9:[7,13,16,20,43,44], 10:[50,47], 11:[50,46], 12:[50,48], 13:[], 14:[16,40,41,39,50,51], 15:[7,17,18,21,34,20,10,52], 16:[40,31,41,56,55], 17:[57], 18:[28,8,41,55,53,63,12,58,59,61,62], 19:[40,63]]
    def matrixEmergency = new int[19][63]


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

    def emergencyType() {

    }

    def question(String id){

        def mayorSymptomActual = 0
        def mayorSymptom = 0
        def idMayorSymptom = 0
        emergencySelected = []
        def emergencies = Emergency.list()
        [emergencies: emergencies]
        emergencies.each {
            if (it.type == id) emergencySelected.add(it.id.intValue())
        }

        for(int emergencias=0; emergencias<19; emergencias++){
            for(int sintomas=0; sintomas<63; sintomas++){
                if(emergencySelected.contains(emergencias)){
                    if(emergency_symptoms[emergencias].contains(sintomas)) {
                        matrixEmergency[emergencias][sintomas] = 1
                        idMayorSymptom = sintomas
                    }
                }
                else
                    matrixEmergency[emergencias][sintomas] = 0
            }
        }

        for(int sintomas=0; sintomas<63; sintomas++){
            for(int emergencias=0; emergencias<19; emergencias++){
                if(matrixEmergency[emergencias][sintomas]==1){
                    mayorSymptom++
                }
            }

            if(mayorSymptom>=mayorSymptomActual){
                idMayorSymptom = sintomas
                mayorSymptomActual=mayorSymptom
            }
            mayorSymptom = 0
        }

        println idMayorSymptom + " con numero de repeticiones " + mayorSymptomActual

        def symptomRepet = Symptom.get(idMayorSymptom)
        render(view: "question", model: [question: symptomRepet.question, imagen: symptomRepet.img])
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
