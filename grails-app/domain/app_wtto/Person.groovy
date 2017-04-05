package app_wtto

class Person {

    String firstName
    String lastName
    Date dateOfBirth

    static constraints = {
        firstName blank: false, nullable: false
        lastName blank: false, nullable: false
        dateOfBirth blank: false, nullable: false, format: "yyyy-MM-dd"
    }

    static mapping = {
        tablePerHierarchy false
    }

    public String toString() {
        "${firstName} ${lastName}"
    }
}
