<%@ page import="kiriwatsan.UserAccount" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'userAccount.label', default: 'UserAccount')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<section id="list-userAccount" class="first">

    <table class="table table-bordered">
        <thead>
        <tr>

            <g:sortableColumn property="realName"
                              title="${message(code: 'userAccount.realName.label', default: 'Real Name')}"/>

            <g:sortableColumn property="email" title="${message(code: 'userAccount.email.label', default: 'Email')}"/>

            <g:sortableColumn property="organisation"
                              title="${message(code: 'userAccount.organisation.label', default: 'Organisation')}"/>

            <g:sortableColumn property="administrator"
                              title="${message(code: 'userAccount.administrator.label', default: 'Administrator')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${userAccountInstanceList}" status="i" var="userAccountInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show"
                            id="${userAccountInstance.id}">${fieldValue(bean: userAccountInstance, field: "realName")}</g:link></td>

                <td>${fieldValue(bean: userAccountInstance, field: "email")}</td>

                <td>${fieldValue(bean: userAccountInstance, field: "organisation")}</td>

                <td><g:formatBoolean boolean="${userAccountInstance.administrator}"/></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <bs:paginate total="${userAccountInstanceTotal}"/>
    </div>
</section>

</body>

</html>
