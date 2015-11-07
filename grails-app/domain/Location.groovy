

class Location {
    String name
    String description
    String city

    double latitude
    double longitude

    static constraints = {
        name blank: false, nullable: false, unique: true
        description blank: false, nullable: false, minSize: 10
        city blank: false, nullable: false
        latitude min: -90d, max: 90d //Between the two poles
    }
}
