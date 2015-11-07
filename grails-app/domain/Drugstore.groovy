import grails.rest.*

@Resource(uri="/dstores")
class Drugstore extends Location{

    String speciality
    static constraints = {
        speciality nullable: true
    }
}
