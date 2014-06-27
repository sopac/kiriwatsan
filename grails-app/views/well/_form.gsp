<%@ page import="kiriwatsan.Well" %>



			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'wellID', 'error')} ">
				<label for="wellID" class="control-label"><g:message code="well.wellID.label" default="Well ID" /></label>
				<div class="controls">
					<g:textField name="wellID" value="${wellInstance?.wellID}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'wellID', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'island', 'error')} ">
				<label for="island" class="control-label"><g:message code="well.island.label" default="Island" /></label>
				<div class="controls">
					<g:textField name="island" value="${wellInstance?.island}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'island', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'villageName', 'error')} ">
				<label for="villageName" class="control-label"><g:message code="well.villageName.label" default="Village Name" /></label>
				<div class="controls">
					<g:textField name="villageName" value="${wellInstance?.villageName}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'villageName', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'wellType', 'error')} ">
				<label for="wellType" class="control-label"><g:message code="well.wellType.label" default="Well Type" /></label>
				<div class="controls">
					<g:textField name="wellType" value="${wellInstance?.wellType}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'wellType', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'wellOwner', 'error')} ">
				<label for="wellOwner" class="control-label"><g:message code="well.wellOwner.label" default="Well Owner" /></label>
				<div class="controls">
					<g:textField name="wellOwner" value="${wellInstance?.wellOwner}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'wellOwner', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'casingType', 'error')} ">
				<label for="casingType" class="control-label"><g:message code="well.casingType.label" default="Casing Type" /></label>
				<div class="controls">
					<g:textField name="casingType" value="${wellInstance?.casingType}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'casingType', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'wellCover', 'error')} ">
				<label for="wellCover" class="control-label"><g:message code="well.wellCover.label" default="Well Cover" /></label>
				<div class="controls">
					<g:textField name="wellCover" value="${wellInstance?.wellCover}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'wellCover', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'wellCoverCondition', 'error')} ">
				<label for="wellCoverCondition" class="control-label"><g:message code="well.wellCoverCondition.label" default="Well Cover Condition" /></label>
				<div class="controls">
					<g:textField name="wellCoverCondition" value="${wellInstance?.wellCoverCondition}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'wellCoverCondition', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'wellCoverMaterial', 'error')} ">
				<label for="wellCoverMaterial" class="control-label"><g:message code="well.wellCoverMaterial.label" default="Well Cover Material" /></label>
				<div class="controls">
					<g:textField name="wellCoverMaterial" value="${wellInstance?.wellCoverMaterial}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'wellCoverMaterial', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'fencingCondition', 'error')} ">
				<label for="fencingCondition" class="control-label"><g:message code="well.fencingCondition.label" default="Fencing Condition" /></label>
				<div class="controls">
					<g:textField name="fencingCondition" value="${wellInstance?.fencingCondition}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'fencingCondition', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'fencingMaterial', 'error')} ">
				<label for="fencingMaterial" class="control-label"><g:message code="well.fencingMaterial.label" default="Fencing Material" /></label>
				<div class="controls">
					<g:textField name="fencingMaterial" value="${wellInstance?.fencingMaterial}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'fencingMaterial', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'wellApronSize', 'error')} ">
				<label for="wellApronSize" class="control-label"><g:message code="well.wellApronSize.label" default="Well Apron Size" /></label>
				<div class="controls">
					<g:textField name="wellApronSize" value="${wellInstance?.wellApronSize}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'wellApronSize', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'wellApronMaterial', 'error')} ">
				<label for="wellApronMaterial" class="control-label"><g:message code="well.wellApronMaterial.label" default="Well Apron Material" /></label>
				<div class="controls">
					<g:textField name="wellApronMaterial" value="${wellInstance?.wellApronMaterial}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'wellApronMaterial', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'wellApronCondition', 'error')} ">
				<label for="wellApronCondition" class="control-label"><g:message code="well.wellApronCondition.label" default="Well Apron Condition" /></label>
				<div class="controls">
					<g:textField name="wellApronCondition" value="${wellInstance?.wellApronCondition}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'wellApronCondition', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'abstractionType', 'error')} ">
				<label for="abstractionType" class="control-label"><g:message code="well.abstractionType.label" default="Abstraction Type" /></label>
				<div class="controls">
					<g:textField name="abstractionType" value="${wellInstance?.abstractionType}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'abstractionType', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'pumpStatus', 'error')} ">
				<label for="pumpStatus" class="control-label"><g:message code="well.pumpStatus.label" default="Pump Status" /></label>
				<div class="controls">
					<g:textField name="pumpStatus" value="${wellInstance?.pumpStatus}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'pumpStatus', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'useOfWater', 'error')} ">
				<label for="useOfWater" class="control-label"><g:message code="well.useOfWater.label" default="Use Of Water" /></label>
				<div class="controls">
					<g:textArea name="useOfWater" cols="40" rows="5" maxlength="750" value="${wellInstance?.useOfWater}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'useOfWater', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'householdUsage', 'error')} ">
				<label for="householdUsage" class="control-label"><g:message code="well.householdUsage.label" default="Household Usage" /></label>
				<div class="controls">
					<g:textField name="householdUsage" value="${wellInstance?.householdUsage}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'householdUsage', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'peopleUsage', 'error')} ">
				<label for="peopleUsage" class="control-label"><g:message code="well.peopleUsage.label" default="People Usage" /></label>
				<div class="controls">
					<g:textField name="peopleUsage" value="${wellInstance?.peopleUsage}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'peopleUsage', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'contaminationSource', 'error')} ">
				<label for="contaminationSource" class="control-label"><g:message code="well.contaminationSource.label" default="Contamination Source" /></label>
				<div class="controls">
					<g:textField name="contaminationSource" value="${wellInstance?.contaminationSource}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'contaminationSource', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'contaminationDist', 'error')} ">
				<label for="contaminationDist" class="control-label"><g:message code="well.contaminationDist.label" default="Contamination Dist" /></label>
				<div class="controls">
					<g:textField name="contaminationDist" value="${wellInstance?.contaminationDist}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'contaminationDist', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'diameterInternal', 'error')} ">
				<label for="diameterInternal" class="control-label"><g:message code="well.diameterInternal.label" default="Diameter Internal" /></label>
				<div class="controls">
					<g:textField name="diameterInternal" value="${wellInstance?.diameterInternal}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'diameterInternal', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'parapetHeight', 'error')} ">
				<label for="parapetHeight" class="control-label"><g:message code="well.parapetHeight.label" default="Parapet Height" /></label>
				<div class="controls">
					<g:textField name="parapetHeight" value="${wellInstance?.parapetHeight}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'parapetHeight', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'distanceToWaterTable', 'error')} ">
				<label for="distanceToWaterTable" class="control-label"><g:message code="well.distanceToWaterTable.label" default="Distance To Water Table" /></label>
				<div class="controls">
					<g:textField name="distanceToWaterTable" value="${wellInstance?.distanceToWaterTable}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'distanceToWaterTable', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'totalDepth', 'error')} ">
				<label for="totalDepth" class="control-label"><g:message code="well.totalDepth.label" default="Total Depth" /></label>
				<div class="controls">
					<g:textField name="totalDepth" value="${wellInstance?.totalDepth}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'totalDepth', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'salinityTop_mScm', 'error')} ">
				<label for="salinityTop_mScm" class="control-label"><g:message code="well.salinityTop_mScm.label" default="Salinity Topm Scm" /></label>
				<div class="controls">
					<g:textField name="salinityTop_mScm" value="${wellInstance?.salinityTop_mScm}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'salinityTop_mScm', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'salinityBase_mScm', 'error')} ">
				<label for="salinityBase_mScm" class="control-label"><g:message code="well.salinityBase_mScm.label" default="Salinity Basem Scm" /></label>
				<div class="controls">
					<g:textField name="salinityBase_mScm" value="${wellInstance?.salinityBase_mScm}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'salinityBase_mScm', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'bacteriological', 'error')} ">
				<label for="bacteriological" class="control-label"><g:message code="well.bacteriological.label" default="Bacteriological" /></label>
				<div class="controls">
					<g:textField name="bacteriological" value="${wellInstance?.bacteriological}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'bacteriological', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'nitrateNitrite', 'error')} ">
				<label for="nitrateNitrite" class="control-label"><g:message code="well.nitrateNitrite.label" default="Nitrate Nitrite" /></label>
				<div class="controls">
					<g:textField name="nitrateNitrite" value="${wellInstance?.nitrateNitrite}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'nitrateNitrite', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'wellImprovements1', 'error')} ">
				<label for="wellImprovements1" class="control-label"><g:message code="well.wellImprovements1.label" default="Well Improvements1" /></label>
				<div class="controls">
					<g:textArea name="wellImprovements1" cols="40" rows="5" maxlength="750" value="${wellInstance?.wellImprovements1}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'wellImprovements1', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'wellImprovements2', 'error')} ">
				<label for="wellImprovements2" class="control-label"><g:message code="well.wellImprovements2.label" default="Well Improvements2" /></label>
				<div class="controls">
					<g:textArea name="wellImprovements2" cols="40" rows="5" maxlength="750" value="${wellInstance?.wellImprovements2}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'wellImprovements2', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'wellImprovements3', 'error')} ">
				<label for="wellImprovements3" class="control-label"><g:message code="well.wellImprovements3.label" default="Well Improvements3" /></label>
				<div class="controls">
					<g:textArea name="wellImprovements3" cols="40" rows="5" maxlength="750" value="${wellInstance?.wellImprovements3}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'wellImprovements3', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'comments', 'error')} ">
				<label for="comments" class="control-label"><g:message code="well.comments.label" default="Comments" /></label>
				<div class="controls">
					<g:textArea name="comments" cols="40" rows="5" maxlength="750" value="${wellInstance?.comments}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'comments', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'photo', 'error')} ">
				<label for="photo" class="control-label"><g:message code="well.photo.label" default="Photo" /></label>
				<div class="controls">
					<g:textField name="photo" value="${wellInstance?.photo}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'photo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'reportPhoto', 'error')} ">
				<label for="reportPhoto" class="control-label"><g:message code="well.reportPhoto.label" default="Report Photo" /></label>
				<div class="controls">
					<g:textField name="reportPhoto" value="${wellInstance?.reportPhoto}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'reportPhoto', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'date', 'error')} ">
				<label for="date" class="control-label"><g:message code="well.date.label" default="Date" /></label>
				<div class="controls">
					<g:textField name="date" value="${wellInstance?.date}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'date', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'time', 'error')} ">
				<label for="time" class="control-label"><g:message code="well.time.label" default="Time" /></label>
				<div class="controls">
					<g:textField name="time" value="${wellInstance?.time}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'time', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'team', 'error')} ">
				<label for="team" class="control-label"><g:message code="well.team.label" default="Team" /></label>
				<div class="controls">
					<g:textField name="team" value="${wellInstance?.team}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'team', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'longitude', 'error')} ">
				<label for="longitude" class="control-label"><g:message code="well.longitude.label" default="Longitude" /></label>
				<div class="controls">
					<g:textField name="longitude" value="${wellInstance?.longitude}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'longitude', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wellInstance, field: 'latitude', 'error')} ">
				<label for="latitude" class="control-label"><g:message code="well.latitude.label" default="Latitude" /></label>
				<div class="controls">
					<g:textField name="latitude" value="${wellInstance?.latitude}"/>
					<span class="help-inline">${hasErrors(bean: wellInstance, field: 'latitude', 'error')}</span>
				</div>
			</div>

