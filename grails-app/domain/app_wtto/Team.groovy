package app_wtto

class Team {

    String name

    static hasOne = [coach: Coach]

    static hasMany = [players: Player]

    static constraints = {
        name blank: false, nullable: false
        players display: false
    }

    public String toString() {
        "${name}"
    }
}
