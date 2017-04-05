<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="app.mainPage.label" /></title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>
<body>
    <div id="list-player" class="content scaffold-list col-lg-6" role="main">
        <h1><g:message code="player.list.label" /></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <f:table collection="${playerList}" />

        <div class="pagination">
            <g:paginate total="${playerCount ?: 0}" />
        </div>
    </div>
    <div id="list-coach" class="content scaffold-list col-lg-6" role="main">
        <h1><g:message code="coach.list.label" /></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <f:table collection="${coachList}" />

        <div class="pagination">
            <g:paginate total="${coachCount ?: 0}" />
        </div>
    </div>
</body>
</html>
