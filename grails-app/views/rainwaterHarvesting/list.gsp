<%@ page import="kiriwatsan.RainwaterHarvesting" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'rainwaterHarvesting.label', default: 'RainwaterHarvesting')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<h3>${listType} (${rainwaterHarvestingInstanceTotal})</h3>

<section id="list-rainwaterHarvesting" class="first">

    <table class="table table-bordered">
        <thead>
        <tr>

            <th><g:message code="rainwaterHarvesting.building.label" default="Building"/></th>

            <th><g:message code="rainwaterHarvesting.building.label" default="Village"/></th>

            <th><g:message code="rainwaterHarvesting.building.label" default="Island"/></th>

            <th><g:message code="rainwaterHarvesting.building.label" default="No. Of Tanks"/></th>

            <th><g:message code="rainwaterHarvesting.building.label" default="Tanks"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${rainwaterHarvestingInstanceList}" status="i" var="rainwaterHarvestingInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show"
                            id="${rainwaterHarvestingInstance.id}">${fieldValue(bean: rainwaterHarvestingInstance, field: "building")}</g:link></td>

                <td>${rainwaterHarvestingInstance.building.villageName}</td>

                <td>${rainwaterHarvestingInstance.building.island}</td>

                <td>${rainwaterHarvestingInstance.tanks.size()}</td>

                <td>
                    <g:each in="${rainwaterHarvestingInstance.tanks}" var="t">
                        <a href="${createLink(controller: 'storage', action: 'show', id: t.id)}">${t.tankID}</a>

                        <br/>
                    </g:each>

                </td>

            </tr>
        </g:each>
        </tbody>
    </table>

</section>

</body>

</html>
