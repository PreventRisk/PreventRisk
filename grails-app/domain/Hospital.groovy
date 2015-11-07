import grails.rest.*

@Resource(uri="/hospitals")
class Hospital extends Location{

    String type
    Integer quality

    static constraints = {
        type blank: false, nullable: false
        quality range: 1..5
    }
}
