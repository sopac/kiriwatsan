
<%@ page import="kiriwatsan.UserAccount" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'userAccount.label', default: 'UserAccount')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-userAccount" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userAccount.realName.label" default="Real Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userAccountInstance, field: "realName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userAccount.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userAccountInstance, field: "email")}</td>
				
			</tr>
		

		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userAccount.organisation.label" default="Organisation" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userAccountInstance, field: "organisation")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userAccount.administrator.label" default="Administrator" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${userAccountInstance?.administrator}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
