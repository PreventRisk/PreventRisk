/**
 * Created by monica on 24/11/15.
 */
class Course {
    double progress;
    String unit;

    //static hasMany = [units: Unit]
    static hasMany = [users: User]

    static constraints = {
        progress nullable: false
    }
}
