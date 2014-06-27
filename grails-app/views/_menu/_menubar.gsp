<div class="">
	<ul class="nav nav-tabs" data-role="listview" data-split-icon="gear" data-filter="true">

        <li class="controller${params.controller == 'home' ? " active" : ""}">
            <a href="${createLink(controller: 'home')}">Home</a>
        </li>

        <li class="controller${params.controller == 'well' ? " active" : ""}">
            <a href="${createLink(controller: 'well')}">Well</a>
        </li>

        <li class="controller${params.controller == 'rainwaterHarvesting' ? " active" : ""}">
            <a href="${createLink(controller: 'rainwaterHarvesting')}">Rainwater Harvesting</a>
        </li>

        <li class="controller${params.controller == 'building' ? " active" : ""}">
            <a href="${createLink(controller: 'building')}">Building</a>
        </li>

        <li class="controller${params.controller == 'storage' ? " active" : ""}">
            <a href="${createLink(controller: 'storage')}">Storage</a>
        </li>

        <li class="controller">
            <a href="${createLink(uri: '/contact')}">Contact</a>
        </li>

        <li class="controller">
            <a href="${createLink(uri: '/about')}">About</a>
        </li>
        %{--
            <g:each status="i" var="c" in="${grailsApplication.controllerClasses.sort { it.logicalPropertyName } }">
                <li class="controller${params.controller == c.logicalPropertyName ? " active" : ""}">
                    <g:link controller="${c.logicalPropertyName}" action="index">
                        <g:message code="${c.logicalPropertyName}.label" default="${c.logicalPropertyName.capitalize()}"/>
                    </g:link>
                </li>
            </g:each>
            --}%
	</ul>
</div>
