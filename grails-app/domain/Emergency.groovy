

class Emergency {

    static hasMany = [symptoms:Symptom]
    String name
    String steps


    static constraints = {
        name nullable: false
        steps nullable: false
        symptoms nullable: false

    }
}
