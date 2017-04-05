package app_wtto

class Coach extends Person {

    Team team

    static constraints = {
        team blank: true, nullable: true, display: false
    }
}
