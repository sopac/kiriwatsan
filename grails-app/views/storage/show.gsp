<%@ page import="kiriwatsan.Storage" %>
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
                center: new google.maps.LatLng(${storageInstance.latitude}, ${storageInstance.longitude}),
                zoom: 24,
                mapTypeId: google.maps.MapTypeId.HYBRID
            };
            var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);

            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(${storageInstance.latitude}, ${storageInstance.longitude}),
                map: map,
                title: "${storageInstance.tankID} - ${storageInstance.villageName}"
            });
        }
    </script>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'storage.label', default: 'Storage')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<g:javascript>
    window.onload = initialize();
</g:javascript>

<section id="show-storage" class="first">

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
    <td valign="top" class="name"><g:message code="storage.tankID.label" default="Tank ID"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "tankID")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.island.label" default="Island"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "island")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.villageName.label" default="Village Name"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "villageName")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.joinedToBuilding.label" default="Joined To Building"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "joinedToBuilding")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.tankType.label" default="Tank Type"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "tankType")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.team.label" default="Team"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "team")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.screenOnTankEntry.label"
                                             default="Screen On Tank Entry"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "screenOnTankEntry")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.storageVolume.label" default="Storage Volume"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "storageVolume")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.tankHeight.label" default="Tank Height"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "tankHeight")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.tankDiameter.label" default="Tank Diameter"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "tankDiameter")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.storageCondition.label" default="Storage Condition"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "storageCondition")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.abstractionType1.label" default="Abstraction Type1"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "abstractionType1")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.abstractionType2.label" default="Abstraction Type2"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "abstractionType2")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.bacteriologicalSample1.label"
                                             default="Bacteriological Sample1"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "bacteriologicalSample1")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.bacteriologicalSample2.label"
                                             default="Bacteriological Sample2"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "bacteriologicalSample2")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.cisternHeight.label" default="Cistern Height"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "cisternHeight")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.cisternWidth.label" default="Cistern Width"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "cisternWidth")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.cisternLength.label" default="Cistern Length"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "cisternLength")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.cisternCondition.label" default="Cistern Condition"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "cisternCondition")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.improvements1.label" default="Improvements1"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "improvements1")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.improvements2.label" default="Improvements2"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "improvements2")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.improvements3.label" default="Improvements3"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "improvements3")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.comments.label" default="Comments"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "comments")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.photo.label" default="Photo"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "photo")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.reportPhoto.label" default="Report Photo"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "reportPhoto")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.date.label" default="Date"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "date")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.time.label" default="Time"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "time")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.longitude.label" default="Longitude"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "longitude")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="storage.latitude.label" default="Latitude"/></td>

    <td valign="top" class="value">${fieldValue(bean: storageInstance, field: "latitude")}</td>

</tr>

</tbody>
</table>
</section>

</body>

</html>
