import static org.springframework.http.HttpStatus.*

import grails.transaction.Transactional

@Transactional(readOnly = true)
class EmergencyController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def emergencySelected = []
    def emergency_symptoms = [1:[1,2,3,4,5,6,7,8,9,10,11,12,40],2:[13,14,15,16,17,18,19,20,40], 3:[21,22,10,24,25,54],
                              4:[21,26,27,54], 5:[28,14,5,30,9,32,12], 6:[34], 7:[35,5,31,38,20,16,25,24], 8:[39,23,40,41,42],
                              9:[43,44,17,20,11,7,16,13], 10:[50,47], 11:[50,46], 12:[50,48], 13:[], 14:[16,40,41,39,50,51,49],
                              15:[6,52,53,11,16,54,20,17,10], 16:[40,51,41,56,55], 17:[57], 18:[28,8,41,55,53,12,58,59,61,62],
                              19:[40,63]]
    def matrixEmergency = new int[20][64]
    def currentSymptomId = 0


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

    def init(String id){
        emergencySelected = []
        def emergencies = Emergency.list()
        [emergencies: emergencies]
        emergencies.each {
            if (id == "Untyped"){
                emergencySelected.add(it.id.intValue())
            }else
                if (it.type == id) emergencySelected.add(it.id.intValue())
        }

        for(int emergencias=0; emergencias<=19; emergencias++){
            for(int sintomas=0; sintomas<=63; sintomas++){
                if(emergencySelected.contains(emergencias)){
                    if(emergency_symptoms[emergencias].contains(sintomas)) {
                        matrixEmergency[emergencias][sintomas] = 1
                    }
                }else{
                    matrixEmergency[emergencias][sintomas] = 0
                }
            }
        }
        println "Matriz inicial-------------"
        for(int i = 0; i<19; i++) println matrixEmergency[i]
        redirect(action: 'find_question')
    }

    def emergencyType() {

    }

    def find_question(){
        boolean justOne = false, all = false
        int count_zeros = 0, emergencyRta = 0, mayorSymptomActual = 0, mayorSymptom = 0

        for(int sintomas=0; sintomas<=63; sintomas++){
            for(int emergencias=0; emergencias<=19; emergencias++){
                if(matrixEmergency[emergencias][sintomas]==1)
                    mayorSymptom++
            }

            if(mayorSymptom >= mayorSymptomActual){
                currentSymptomId = sintomas
                mayorSymptomActual = mayorSymptom
            }
            mayorSymptom = 0
        }

        println "Symptom: " + currentSymptomId + " repeats: " + mayorSymptomActual + " times."
        for(int enfermedades = 0; enfermedades <=19; enfermedades++){
            if (matrixEmergency[enfermedades].sum() > 0){
                emergencyRta = enfermedades
                if(!justOne) justOne = true
                else{
                    justOne = false
                    break
                }
            }else if (matrixEmergency[enfermedades].sum() == 0){
                count_zeros += 1
            }
        }

        if (count_zeros == 20) all = true

        println "JustOne?: " + justOne
        println "All?: " + all

        if (justOne){
            println emergencyRta
            def symptomRepet = Emergency.get(emergencyRta)
            def step = symptomRepet.steps.toString()
            def steps = new String[10]
            def line = ''
            def number_of_lines = 0
            step.each {
                if (it == '\u2022'){
                    steps[number_of_lines] = line
                    line = ''
                    number_of_lines += 1
                }
                line += it
            }
            steps[number_of_lines] = line
            [steps: steps]
            render(view: "answer", model: [name: symptomRepet.name, steps: steps, image: symptomRepet.img, video: symptomRepet.video], lines: number_of_lines)
        }
        else if(!justOne) {
            if (all) render(view: "incomplete", model: [name: "Datos insuficientes", steps: "Por favor repita la simulacion"])
            else {
                def symptomRepet = Symptom.get(currentSymptomId)
                render(view: "question", model: [question: symptomRepet.question, image: symptomRepet.img])
            }
        }
    }

    def question(String id){
        def choosen = -1

        if (id == "YES"){
            println "YES! YES! YES! YES!"
            choosen = 0
        }

        else if (id == "NO"){
            println "NO! NO! NO! NO!"
            choosen = 1
        }

        for(int emergencias = 0; emergencias<=19; emergencias++){
            if(matrixEmergency[emergencias][currentSymptomId] == choosen){
                for(int sintomas=0; sintomas<=63; sintomas++) matrixEmergency[emergencias][sintomas] = 0
            }
            if(matrixEmergency[emergencias].sum() > 1)
                matrixEmergency[emergencias][currentSymptomId] = 0
        }

        for(int i = 0; i<=19; i++) println matrixEmergency[i]

        redirect(action: "find_question")
    }

    def incomplete(){
        render (view: 'incomplete')
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
