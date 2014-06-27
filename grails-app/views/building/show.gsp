<%@ page import="kiriwatsan.Building" %>
<!doctype html>
<html>

<head>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
    <script src="http://ict.sopac.org/galleria/galleria-1.2.8.min.js"></script>
    <style>
    #galleria {
        width: 100%;
        height: 400px;
        background: #000;

    }

    #map_canvas {
        width: 100%;
        height: 400px;
    }
    </style>

    <script type="text/javascript"
            src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCPhluJkSjANO9lkaxUrXjNmtVTIqANjX8&sensor=false"></script>

    <script type="text/javascript">
        function initialize() {
            var mapOptions = {
                center: new google.maps.LatLng(${buildingInstance.latitude}, ${buildingInstance.longitude}),
                zoom: 24,
                mapTypeId: google.maps.MapTypeId.HYBRID
            };
            var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);

            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(${buildingInstance.latitude}, ${buildingInstance.longitude}),
                map: map,
                title: "${buildingInstance.buildingID} - ${buildingInstance.villageName}"
            });
        }
    </script>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'building.label', default: 'Building')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<g:javascript>
    window.onload = initialize();
</g:javascript>

<section id="show-building" class="first">

    <g:if test="${photos.size() != 0}">
        <div align="left" style="width: 100%">
            <div id="galleria">
                <g:each in="${photos}" var="p">
                    <g:img uri="http://www.sopac.org/sopac/kiriwatsanphoto/${p}"/>
                </g:each>
            </div>
        </div>
        <script>
            Galleria.loadTheme('http://ict.sopac.org/galleria/themes/classic/galleria.classic.min.js');
            Galleria.run('#galleria');
        </script>
    </g:if>

    <br/>

    <div align="center" style="border: 2px; border-color: black">
        <div id="map_canvas"></div>
    </div>

    <br/>

    <table class="table">
        <tbody>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="building.buildingID.label" default="Building ID"/></td>

            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "buildingID")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="building.island.label" default="Island"/></td>

            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "island")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="building.villageName.label" default="Village Name"/></td>

            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "villageName")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="building.buildingType.label" default="Building Type"/></td>

            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "buildingType")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="building.owner.label" default="Owner"/></td>

            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "owner")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="building.team.label" default="Team"/></td>

            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "team")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="building.roofLength.label" default="Roof Length"/></td>

            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "roofLength")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="building.roofWidth.label" default="Roof Width"/></td>

            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "roofWidth")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="building.roofHeight.label" default="Roof Height"/></td>

            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "roofHeight")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="building.roofMaterial.label" default="Roof Material"/></td>

            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "roofMaterial")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="building.roofConditions.label"
                                                     default="Roof Conditions"/></td>

            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "roofConditions")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="building.fasciaBoard.label" default="Fascia Board"/></td>

            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "fasciaBoard")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="building.gutteringCondition.label"
                                                     default="Guttering Condition"/></td>

            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "gutteringCondition")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="building.gutterCoverage.label"
                                                     default="Gutter Coverage"/></td>

            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "gutterCoverage")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="building.downPipe.label" default="Down Pipe"/></td>

            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "downPipe")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="building.overhangingVegetation.label"
                                                     default="Overhanging Vegetation"/></td>

            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "overhangingVegetation")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="building.comments.label" default="Comments"/></td>

            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "comments")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="building.photo.label" default="Photo"/></td>

            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "photo")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="building.reportPhoto.label" default="Report Photo"/></td>

            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "reportPhoto")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="building.date.label" default="Date"/></td>

            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "date")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="building.time.label" default="Time"/></td>

            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "time")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="building.longitude.label" default="Longitude"/></td>

            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "longitude")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="building.latitude.label" default="Latitude"/></td>

            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "latitude")}</td>

        </tr>

        </tbody>
    </table>
</section>

</body>

</html>
