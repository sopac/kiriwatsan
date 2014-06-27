
<%@ page import="kiriwatsan.Storage" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'storage.label', default: 'Storage')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-storage" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="tankID" title="${message(code: 'storage.tankID.label', default: 'Tank ID')}" />
			
				<g:sortableColumn property="island" title="${message(code: 'storage.island.label', default: 'island')}" />
			
				<g:sortableColumn property="villageName" title="${message(code: 'storage.villageName.label', default: 'Village Name')}" />
			
				<g:sortableColumn property="joinedToBuilding" title="${message(code: 'storage.joinedToBuilding.label', default: 'Joined To Building')}" />
			
				<g:sortableColumn property="tankType" title="${message(code: 'storage.tankType.label', default: 'Tank Type')}" />
			
				<g:sortableColumn property="team" title="${message(code: 'storage.team.label', default: 'team')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${storageInstanceList}" status="i" var="storageInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${storageInstance.id}">${fieldValue(bean: storageInstance, field: "tankID")}</g:link></td>
			
				<td>${fieldValue(bean: storageInstance, field: "island")}</td>
			
				<td>${fieldValue(bean: storageInstance, field: "villageName")}</td>
			
				<td>${fieldValue(bean: storageInstance, field: "joinedToBuilding")}</td>
			
				<td>${fieldValue(bean: storageInstance, field: "tankType")}</td>
			
				<td>${fieldValue(bean: storageInstance, field: "team")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${storageInstanceTotal}" />
	</div>
</section>

</body>

</html>
