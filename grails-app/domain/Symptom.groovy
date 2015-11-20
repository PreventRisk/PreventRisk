

class Symptom {
    static hasMany = [emergencies:Emergency]
    static belongsTo = [Emergency]
    String name

    static constraints = {
        name nullable: false
        emergencies nullable: false

    }
}
