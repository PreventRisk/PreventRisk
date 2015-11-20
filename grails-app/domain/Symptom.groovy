

class Symptom {
    static hasMany = [emergencies:Emergency]
    static belongsTo = [Emergency]
    String name
    String question
    String img

    static constraints = {
        name nullable: false
        emergencies nullable: false
        question nullable: false
        img nullable: true
    }
}
