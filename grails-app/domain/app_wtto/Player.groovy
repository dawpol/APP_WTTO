package app_wtto

class Player extends Person {

    Team team

    static constraints = {
        team blank: true, nullable: true
    }
}