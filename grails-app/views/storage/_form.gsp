<%@ page import="kiriwatsan.Storage" %>



			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'tankID', 'error')} ">
				<label for="tankID" class="control-label"><g:message code="storage.tankID.label" default="Tank ID" /></label>
				<div class="controls">
					<g:textField name="tankID" value="${storageInstance?.tankID}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'tankID', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'island', 'error')} ">
				<label for="island" class="control-label"><g:message code="storage.island.label" default="Island" /></label>
				<div class="controls">
					<g:textField name="island" value="${storageInstance?.island}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'island', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'villageName', 'error')} ">
				<label for="villageName" class="control-label"><g:message code="storage.villageName.label" default="Village Name" /></label>
				<div class="controls">
					<g:textField name="villageName" value="${storageInstance?.villageName}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'villageName', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'joinedToBuilding', 'error')} ">
				<label for="joinedToBuilding" class="control-label"><g:message code="storage.joinedToBuilding.label" default="Joined To Building" /></label>
				<div class="controls">
					<g:textField name="joinedToBuilding" value="${storageInstance?.joinedToBuilding}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'joinedToBuilding', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'tankType', 'error')} ">
				<label for="tankType" class="control-label"><g:message code="storage.tankType.label" default="Tank Type" /></label>
				<div class="controls">
					<g:textField name="tankType" value="${storageInstance?.tankType}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'tankType', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'team', 'error')} ">
				<label for="team" class="control-label"><g:message code="storage.team.label" default="Team" /></label>
				<div class="controls">
					<g:textField name="team" value="${storageInstance?.team}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'team', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'screenOnTankEntry', 'error')} ">
				<label for="screenOnTankEntry" class="control-label"><g:message code="storage.screenOnTankEntry.label" default="Screen On Tank Entry" /></label>
				<div class="controls">
					<g:textField name="screenOnTankEntry" value="${storageInstance?.screenOnTankEntry}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'screenOnTankEntry', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'storageVolume', 'error')} ">
				<label for="storageVolume" class="control-label"><g:message code="storage.storageVolume.label" default="Storage Volume" /></label>
				<div class="controls">
					<g:textField name="storageVolume" value="${storageInstance?.storageVolume}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'storageVolume', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'tankHeight', 'error')} ">
				<label for="tankHeight" class="control-label"><g:message code="storage.tankHeight.label" default="Tank Height" /></label>
				<div class="controls">
					<g:textField name="tankHeight" value="${storageInstance?.tankHeight}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'tankHeight', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'tankDiameter', 'error')} ">
				<label for="tankDiameter" class="control-label"><g:message code="storage.tankDiameter.label" default="Tank Diameter" /></label>
				<div class="controls">
					<g:textField name="tankDiameter" value="${storageInstance?.tankDiameter}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'tankDiameter', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'storageCondition', 'error')} ">
				<label for="storageCondition" class="control-label"><g:message code="storage.storageCondition.label" default="Storage Condition" /></label>
				<div class="controls">
					<g:textField name="storageCondition" value="${storageInstance?.storageCondition}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'storageCondition', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'abstractionType1', 'error')} ">
				<label for="abstractionType1" class="control-label"><g:message code="storage.abstractionType1.label" default="Abstraction Type1" /></label>
				<div class="controls">
					<g:textField name="abstractionType1" value="${storageInstance?.abstractionType1}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'abstractionType1', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'abstractionType2', 'error')} ">
				<label for="abstractionType2" class="control-label"><g:message code="storage.abstractionType2.label" default="Abstraction Type2" /></label>
				<div class="controls">
					<g:textField name="abstractionType2" value="${storageInstance?.abstractionType2}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'abstractionType2', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'bacteriologicalSample1', 'error')} ">
				<label for="bacteriologicalSample1" class="control-label"><g:message code="storage.bacteriologicalSample1.label" default="Bacteriological Sample1" /></label>
				<div class="controls">
					<g:textField name="bacteriologicalSample1" value="${storageInstance?.bacteriologicalSample1}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'bacteriologicalSample1', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'bacteriologicalSample2', 'error')} ">
				<label for="bacteriologicalSample2" class="control-label"><g:message code="storage.bacteriologicalSample2.label" default="Bacteriological Sample2" /></label>
				<div class="controls">
					<g:textField name="bacteriologicalSample2" value="${storageInstance?.bacteriologicalSample2}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'bacteriologicalSample2', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'cisternHeight', 'error')} ">
				<label for="cisternHeight" class="control-label"><g:message code="storage.cisternHeight.label" default="Cistern Height" /></label>
				<div class="controls">
					<g:textField name="cisternHeight" value="${storageInstance?.cisternHeight}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'cisternHeight', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'cisternWidth', 'error')} ">
				<label for="cisternWidth" class="control-label"><g:message code="storage.cisternWidth.label" default="Cistern Width" /></label>
				<div class="controls">
					<g:textField name="cisternWidth" value="${storageInstance?.cisternWidth}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'cisternWidth', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'cisternLength', 'error')} ">
				<label for="cisternLength" class="control-label"><g:message code="storage.cisternLength.label" default="Cistern Length" /></label>
				<div class="controls">
					<g:textField name="cisternLength" value="${storageInstance?.cisternLength}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'cisternLength', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'cisternCondition', 'error')} ">
				<label for="cisternCondition" class="control-label"><g:message code="storage.cisternCondition.label" default="Cistern Condition" /></label>
				<div class="controls">
					<g:textField name="cisternCondition" value="${storageInstance?.cisternCondition}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'cisternCondition', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'improvements1', 'error')} ">
				<label for="improvements1" class="control-label"><g:message code="storage.improvements1.label" default="Improvements1" /></label>
				<div class="controls">
					<g:textField name="improvements1" value="${storageInstance?.improvements1}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'improvements1', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'improvements2', 'error')} ">
				<label for="improvements2" class="control-label"><g:message code="storage.improvements2.label" default="Improvements2" /></label>
				<div class="controls">
					<g:textField name="improvements2" value="${storageInstance?.improvements2}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'improvements2', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'improvements3', 'error')} ">
				<label for="improvements3" class="control-label"><g:message code="storage.improvements3.label" default="Improvements3" /></label>
				<div class="controls">
					<g:textField name="improvements3" value="${storageInstance?.improvements3}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'improvements3', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'comments', 'error')} ">
				<label for="comments" class="control-label"><g:message code="storage.comments.label" default="Comments" /></label>
				<div class="controls">
					<g:textField name="comments" value="${storageInstance?.comments}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'comments', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'photo', 'error')} ">
				<label for="photo" class="control-label"><g:message code="storage.photo.label" default="Photo" /></label>
				<div class="controls">
					<g:textField name="photo" value="${storageInstance?.photo}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'photo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'reportPhoto', 'error')} ">
				<label for="reportPhoto" class="control-label"><g:message code="storage.reportPhoto.label" default="Report Photo" /></label>
				<div class="controls">
					<g:textField name="reportPhoto" value="${storageInstance?.reportPhoto}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'reportPhoto', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'date', 'error')} ">
				<label for="date" class="control-label"><g:message code="storage.date.label" default="Date" /></label>
				<div class="controls">
					<g:textField name="date" value="${storageInstance?.date}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'date', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'time', 'error')} ">
				<label for="time" class="control-label"><g:message code="storage.time.label" default="Time" /></label>
				<div class="controls">
					<g:textField name="time" value="${storageInstance?.time}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'time', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'longitude', 'error')} ">
				<label for="longitude" class="control-label"><g:message code="storage.longitude.label" default="Longitude" /></label>
				<div class="controls">
					<g:textField name="longitude" value="${storageInstance?.longitude}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'longitude', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: storageInstance, field: 'latitude', 'error')} ">
				<label for="latitude" class="control-label"><g:message code="storage.latitude.label" default="Latitude" /></label>
				<div class="controls">
					<g:textField name="latitude" value="${storageInstance?.latitude}"/>
					<span class="help-inline">${hasErrors(bean: storageInstance, field: 'latitude', 'error')}</span>
				</div>
			</div>

