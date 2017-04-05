package app_wtto

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CoachController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Coach.list(params), model:[coachCount: Coach.count()]
    }

    def show(Coach coach) {
        respond coach
    }

    def create() {
        respond new Coach(params)
    }

    @Transactional
    def save(Coach coach) {
        if (coach == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (coach.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond coach.errors, view:'create'
            return
        }

        coach.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'coach.label', default: 'Coach'), coach.id])
                redirect coach
            }
            '*' { respond coach, [status: CREATED] }
        }
    }

    def edit(Coach coach) {
        respond coach
    }

    @Transactional
    def update(Coach coach) {
        if (coach == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (coach.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond coach.errors, view:'edit'
            return
        }

        coach.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'coach.label', default: 'Coach'), coach.id])
                redirect coach
            }
            '*'{ respond coach, [status: OK] }
        }
    }

    @Transactional
    def delete(Coach coach) {

        if (coach == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        coach.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'coach.label', default: 'Coach'), coach.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'coach.label', default: 'Coach'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
