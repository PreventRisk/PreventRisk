

class Emergency {

    static hasMany = [symptoms:Symptom]
    String name
    String steps
    String type
    String img
    String video

    static constraints = {
        name nullable: false
        steps nullable: false, maxSize: 2000
        symptoms nullable: false
        type nullable: false
        img nullable: true
        video nullable: true

    }
}
