package app_wtto

class IndexController {

    def index() {
        params.max = 10
        def coachList = Coach.list(params)
        def playerList = Player.list(params)
        render(view: "/index", model: [coachList: coachList, playerList: playerList])
    }
}
