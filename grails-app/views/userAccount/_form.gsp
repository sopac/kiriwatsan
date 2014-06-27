<%@ page import="kiriwatsan.UserAccount" %>



			<div class="control-group fieldcontain ${hasErrors(bean: userAccountInstance, field: 'realName', 'error')} ">
				<label for="realName" class="control-label"><g:message code="userAccount.realName.label" default="Real Name" /></label>
				<div class="controls">
					<g:textField name="realName" value="${userAccountInstance?.realName}"/>
					<span class="help-inline">${hasErrors(bean: userAccountInstance, field: 'realName', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userAccountInstance, field: 'email', 'error')} ">
				<label for="email" class="control-label"><g:message code="userAccount.email.label" default="Email" /></label>
				<div class="controls">
					<g:field type="email" name="email" value="${userAccountInstance?.email}"/>
					<span class="help-inline">${hasErrors(bean: userAccountInstance, field: 'email', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userAccountInstance, field: 'password', 'error')} ">
				<label for="password" class="control-label"><g:message code="userAccount.password.label" default="Password" /></label>
				<div class="controls">
					<g:field type="password" name="password" value="${userAccountInstance?.password}"/>
					<span class="help-inline">${hasErrors(bean: userAccountInstance, field: 'password', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userAccountInstance, field: 'organisation', 'error')} ">
				<label for="organisation" class="control-label"><g:message code="userAccount.organisation.label" default="Organisation" /></label>
				<div class="controls">
					<g:textField name="organisation" value="${userAccountInstance?.organisation}"/>
					<span class="help-inline">${hasErrors(bean: userAccountInstance, field: 'organisation', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userAccountInstance, field: 'administrator', 'error')} ">
				<label for="administrator" class="control-label"><g:message code="userAccount.administrator.label" default="Administrator" /></label>
				<div class="controls">
					<bs:checkBox name="administrator" value="${userAccountInstance?.administrator}" />
					<span class="help-inline">${hasErrors(bean: userAccountInstance, field: 'administrator', 'error')}</span>
				</div>
			</div>

