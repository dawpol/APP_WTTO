<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'player.label', default: 'Player')}" />
        <title><g:message code="player.list.label" /></title>
    </head>
    <body>
        <a href="#list-player" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="player.new.label" /></g:link></li>
            </ul>
        </div>
        <div id="list-player" class="content scaffold-list" role="main">
            <h1><g:message code="player.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${playerList}" />

            <div class="pagination">
                <g:paginate total="${playerCount ?: 0}" />
            </div>
        </div>
    </body>
</html>