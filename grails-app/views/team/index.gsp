<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'team.label', default: 'Team')}" />
        <title><g:message code="team.list.label" /></title>
    </head>
    <body>
        <a href="#list-team" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="team.new.label" /></g:link></li>
            </ul>
        </div>
        <div id="list-team" class="content scaffold-list" role="main">
            <h1><g:message code="team.list.label" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${teamList}" />

            <div class="pagination">
                <g:paginate total="${teamCount ?: 0}" />
            </div>
        </div>
    </body>
</html>