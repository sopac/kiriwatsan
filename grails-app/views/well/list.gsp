<%@ page import="kiriwatsan.Well" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'well.label', default: 'Well')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<h3>${listType} (${wellInstanceTotal})</h3>

<section id="list-well" class="first">

    <table class="table table-bordered">
        <thead>
        <tr>

            <g:sortableColumn property="wellID" title="${message(code: 'well.wellID.label', default: 'Well ID')}"/>

            <g:sortableColumn property="island" title="${message(code: 'well.island.label', default: 'island')}"/>

            <g:sortableColumn property="villageName"
                              title="${message(code: 'well.villageName.label', default: 'Village Name')}"/>

            <g:sortableColumn property="wellType"
                              title="${message(code: 'well.wellType.label', default: 'Well Type')}"/>

            <g:sortableColumn property="wellOwner"
                              title="${message(code: 'well.wellOwner.label', default: 'Well owner')}"/>

            <g:sortableColumn property="casingType"
                              title="${message(code: 'well.casingType.label', default: 'Casing Type')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${wellInstanceList}" status="i" var="wellInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show"
                            id="${wellInstance.id}">${fieldValue(bean: wellInstance, field: "wellID")}</g:link></td>

                <td>${fieldValue(bean: wellInstance, field: "island")}</td>

                <td>${fieldValue(bean: wellInstance, field: "villageName")}</td>

                <td>${fieldValue(bean: wellInstance, field: "wellType")}</td>

                <td>${fieldValue(bean: wellInstance, field: "wellOwner")}</td>

                <td>${fieldValue(bean: wellInstance, field: "casingType")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

</section>

</body>

</html>
