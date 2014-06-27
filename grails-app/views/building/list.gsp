
<%@ page import="kiriwatsan.Building" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'building.label', default: 'Building')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-building" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="buildingID" title="${message(code: 'building.buildingID.label', default: 'Building ID')}" />
			
				<g:sortableColumn property="island" title="${message(code: 'building.island.label', default: 'island')}" />
			
				<g:sortableColumn property="villageName" title="${message(code: 'building.villageName.label', default: 'Village Name')}" />
			
				<g:sortableColumn property="buildingType" title="${message(code: 'building.buildingType.label', default: 'Building Type')}" />
			
				<g:sortableColumn property="owner" title="${message(code: 'building.owner.label', default: 'owner')}" />
			
				<g:sortableColumn property="team" title="${message(code: 'building.team.label', default: 'team')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${buildingInstanceList}" status="i" var="buildingInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${buildingInstance.id}">${fieldValue(bean: buildingInstance, field: "buildingID")}</g:link></td>
			
				<td>${fieldValue(bean: buildingInstance, field: "island")}</td>
			
				<td>${fieldValue(bean: buildingInstance, field: "villageName")}</td>
			
				<td>${fieldValue(bean: buildingInstance, field: "buildingType")}</td>
			
				<td>${fieldValue(bean: buildingInstance, field: "owner")}</td>
			
				<td>${fieldValue(bean: buildingInstance, field: "team")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${buildingInstanceTotal}" />
	</div>
</section>

</body>

</html>
