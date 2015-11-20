

class Emergency {

    static hasMany = [symptoms:Symptom]
    String name
    String category
    String steps

    static constraints = {
        name nullable: false
        steps nullable: false, maxSize: 2000
        symptoms nullable: false
        category nullable: false
    }
}
