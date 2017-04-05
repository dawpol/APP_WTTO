<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'player.label', default: 'Player')}" />
        <title><g:message code="player.edit.label" /></title>
    </head>
    <body>
        <a href="#edit-player" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="player.list.label" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="player.new.label" /></g:link></li>
            </ul>
        </div>
        <div id="edit-player" class="content scaffold-edit" role="main">
            <h1><g:message code="player.edit.label" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.player}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.player}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.player}" method="PUT">
                <g:hiddenField name="version" value="${this.player?.version}" />
                <fieldset class="form">
                    <f:all bean="player"/>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
