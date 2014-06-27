<%@ page import="kiriwatsan.RainwaterHarvesting" %>



			<div class="control-group fieldcontain ${hasErrors(bean: rainwaterHarvestingInstance, field: 'building', 'error')} required">
				<label for="building" class="control-label"><g:message code="rainwaterHarvesting.building.label" default="Building" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="building" name="building.id" from="${kiriwatsan.Building.list()}" optionKey="id" required="" value="${rainwaterHarvestingInstance?.building?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: rainwaterHarvestingInstance, field: 'building', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: rainwaterHarvestingInstance, field: 'tanks', 'error')} ">
				<label for="tanks" class="control-label"><g:message code="rainwaterHarvesting.tanks.label" default="Tanks" /></label>
				<div class="controls">
					<g:select name="tanks" from="${kiriwatsan.Storage.list()}" multiple="multiple" optionKey="id" size="5" value="${rainwaterHarvestingInstance?.tanks*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: rainwaterHarvestingInstance, field: 'tanks', 'error')}</span>
				</div>
			</div>

