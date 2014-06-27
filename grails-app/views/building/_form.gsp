<%@ page import="kiriwatsan.Building" %>



			<div class="control-group fieldcontain ${hasErrors(bean: buildingInstance, field: 'buildingID', 'error')} ">
				<label for="buildingID" class="control-label"><g:message code="building.buildingID.label" default="Building ID" /></label>
				<div class="controls">
					<g:textField name="buildingID" value="${buildingInstance?.buildingID}"/>
					<span class="help-inline">${hasErrors(bean: buildingInstance, field: 'buildingID', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: buildingInstance, field: 'island', 'error')} ">
				<label for="island" class="control-label"><g:message code="building.island.label" default="Island" /></label>
				<div class="controls">
					<g:textField name="island" value="${buildingInstance?.island}"/>
					<span class="help-inline">${hasErrors(bean: buildingInstance, field: 'island', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: buildingInstance, field: 'villageName', 'error')} ">
				<label for="villageName" class="control-label"><g:message code="building.villageName.label" default="Village Name" /></label>
				<div class="controls">
					<g:textField name="villageName" value="${buildingInstance?.villageName}"/>
					<span class="help-inline">${hasErrors(bean: buildingInstance, field: 'villageName', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: buildingInstance, field: 'buildingType', 'error')} ">
				<label for="buildingType" class="control-label"><g:message code="building.buildingType.label" default="Building Type" /></label>
				<div class="controls">
					<g:textField name="buildingType" value="${buildingInstance?.buildingType}"/>
					<span class="help-inline">${hasErrors(bean: buildingInstance, field: 'buildingType', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: buildingInstance, field: 'owner', 'error')} ">
				<label for="owner" class="control-label"><g:message code="building.owner.label" default="Owner" /></label>
				<div class="controls">
					<g:textField name="owner" value="${buildingInstance?.owner}"/>
					<span class="help-inline">${hasErrors(bean: buildingInstance, field: 'owner', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: buildingInstance, field: 'team', 'error')} ">
				<label for="team" class="control-label"><g:message code="building.team.label" default="Team" /></label>
				<div class="controls">
					<g:textField name="team" value="${buildingInstance?.team}"/>
					<span class="help-inline">${hasErrors(bean: buildingInstance, field: 'team', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: buildingInstance, field: 'roofLength', 'error')} ">
				<label for="roofLength" class="control-label"><g:message code="building.roofLength.label" default="Roof Length" /></label>
				<div class="controls">
					<g:textField name="roofLength" value="${buildingInstance?.roofLength}"/>
					<span class="help-inline">${hasErrors(bean: buildingInstance, field: 'roofLength', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: buildingInstance, field: 'roofWidth', 'error')} ">
				<label for="roofWidth" class="control-label"><g:message code="building.roofWidth.label" default="Roof Width" /></label>
				<div class="controls">
					<g:textField name="roofWidth" value="${buildingInstance?.roofWidth}"/>
					<span class="help-inline">${hasErrors(bean: buildingInstance, field: 'roofWidth', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: buildingInstance, field: 'roofHeight', 'error')} ">
				<label for="roofHeight" class="control-label"><g:message code="building.roofHeight.label" default="Roof Height" /></label>
				<div class="controls">
					<g:textField name="roofHeight" value="${buildingInstance?.roofHeight}"/>
					<span class="help-inline">${hasErrors(bean: buildingInstance, field: 'roofHeight', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: buildingInstance, field: 'roofMaterial', 'error')} ">
				<label for="roofMaterial" class="control-label"><g:message code="building.roofMaterial.label" default="Roof Material" /></label>
				<div class="controls">
					<g:textField name="roofMaterial" value="${buildingInstance?.roofMaterial}"/>
					<span class="help-inline">${hasErrors(bean: buildingInstance, field: 'roofMaterial', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: buildingInstance, field: 'roofConditions', 'error')} ">
				<label for="roofConditions" class="control-label"><g:message code="building.roofConditions.label" default="Roof Conditions" /></label>
				<div class="controls">
					<g:textField name="roofConditions" value="${buildingInstance?.roofConditions}"/>
					<span class="help-inline">${hasErrors(bean: buildingInstance, field: 'roofConditions', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: buildingInstance, field: 'fasciaBoard', 'error')} ">
				<label for="fasciaBoard" class="control-label"><g:message code="building.fasciaBoard.label" default="Fascia Board" /></label>
				<div class="controls">
					<g:textField name="fasciaBoard" value="${buildingInstance?.fasciaBoard}"/>
					<span class="help-inline">${hasErrors(bean: buildingInstance, field: 'fasciaBoard', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: buildingInstance, field: 'gutteringCondition', 'error')} ">
				<label for="gutteringCondition" class="control-label"><g:message code="building.gutteringCondition.label" default="Guttering Condition" /></label>
				<div class="controls">
					<g:textField name="gutteringCondition" value="${buildingInstance?.gutteringCondition}"/>
					<span class="help-inline">${hasErrors(bean: buildingInstance, field: 'gutteringCondition', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: buildingInstance, field: 'gutterCoverage', 'error')} ">
				<label for="gutterCoverage" class="control-label"><g:message code="building.gutterCoverage.label" default="Gutter Coverage" /></label>
				<div class="controls">
					<g:textField name="gutterCoverage" value="${buildingInstance?.gutterCoverage}"/>
					<span class="help-inline">${hasErrors(bean: buildingInstance, field: 'gutterCoverage', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: buildingInstance, field: 'downPipe', 'error')} ">
				<label for="downPipe" class="control-label"><g:message code="building.downPipe.label" default="Down Pipe" /></label>
				<div class="controls">
					<g:textField name="downPipe" value="${buildingInstance?.downPipe}"/>
					<span class="help-inline">${hasErrors(bean: buildingInstance, field: 'downPipe', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: buildingInstance, field: 'overhangingVegetation', 'error')} ">
				<label for="overhangingVegetation" class="control-label"><g:message code="building.overhangingVegetation.label" default="Overhanging Vegetation" /></label>
				<div class="controls">
					<g:textField name="overhangingVegetation" value="${buildingInstance?.overhangingVegetation}"/>
					<span class="help-inline">${hasErrors(bean: buildingInstance, field: 'overhangingVegetation', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: buildingInstance, field: 'comments', 'error')} ">
				<label for="comments" class="control-label"><g:message code="building.comments.label" default="Comments" /></label>
				<div class="controls">
					<g:textField name="comments" value="${buildingInstance?.comments}"/>
					<span class="help-inline">${hasErrors(bean: buildingInstance, field: 'comments', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: buildingInstance, field: 'photo', 'error')} ">
				<label for="photo" class="control-label"><g:message code="building.photo.label" default="Photo" /></label>
				<div class="controls">
					<g:textField name="photo" value="${buildingInstance?.photo}"/>
					<span class="help-inline">${hasErrors(bean: buildingInstance, field: 'photo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: buildingInstance, field: 'reportPhoto', 'error')} ">
				<label for="reportPhoto" class="control-label"><g:message code="building.reportPhoto.label" default="Report Photo" /></label>
				<div class="controls">
					<g:textField name="reportPhoto" value="${buildingInstance?.reportPhoto}"/>
					<span class="help-inline">${hasErrors(bean: buildingInstance, field: 'reportPhoto', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: buildingInstance, field: 'date', 'error')} ">
				<label for="date" class="control-label"><g:message code="building.date.label" default="Date" /></label>
				<div class="controls">
					<g:textField name="date" value="${buildingInstance?.date}"/>
					<span class="help-inline">${hasErrors(bean: buildingInstance, field: 'date', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: buildingInstance, field: 'time', 'error')} ">
				<label for="time" class="control-label"><g:message code="building.time.label" default="Time" /></label>
				<div class="controls">
					<g:textField name="time" value="${buildingInstance?.time}"/>
					<span class="help-inline">${hasErrors(bean: buildingInstance, field: 'time', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: buildingInstance, field: 'longitude', 'error')} ">
				<label for="longitude" class="control-label"><g:message code="building.longitude.label" default="Longitude" /></label>
				<div class="controls">
					<g:textField name="longitude" value="${buildingInstance?.longitude}"/>
					<span class="help-inline">${hasErrors(bean: buildingInstance, field: 'longitude', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: buildingInstance, field: 'latitude', 'error')} ">
				<label for="latitude" class="control-label"><g:message code="building.latitude.label" default="Latitude" /></label>
				<div class="controls">
					<g:textField name="latitude" value="${buildingInstance?.latitude}"/>
					<span class="help-inline">${hasErrors(bean: buildingInstance, field: 'latitude', 'error')}</span>
				</div>
			</div>

