<%@ page import="kiriwatsan.Well" %>
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
                center: new google.maps.LatLng(${wellInstance.latitude}, ${wellInstance.longitude}),
                zoom: 24,
                mapTypeId: google.maps.MapTypeId.HYBRID
            };
            var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);

            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(${wellInstance.latitude}, ${wellInstance.longitude}),
                map: map,
                title: "${wellInstance.wellID} - ${wellInstance.villageName}"
            });
        }
    </script>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'well.label', default: 'Well')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<g:javascript>
    window.onload = initialize();
</g:javascript>

<section id="show-well" class="first">

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
    <td valign="top" class="name"><g:message code="well.wellID.label" default="Well ID"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "wellID")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.island.label" default="Island"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "island")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.villageName.label" default="Village Name"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "villageName")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.wellType.label" default="Well Type"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "wellType")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.wellOwner.label" default="Well Owner"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "wellOwner")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.casingType.label" default="Casing Type"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "casingType")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.wellCover.label" default="Well Cover"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "wellCover")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.wellCoverCondition.label" default="Well Cover Condition"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "wellCoverCondition")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.wellCoverMaterial.label" default="Well Cover Material"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "wellCoverMaterial")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.fencingCondition.label" default="Fencing Condition"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "fencingCondition")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.fencingMaterial.label" default="Fencing Material"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "fencingMaterial")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.wellApronSize.label" default="Well Apron Size"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "wellApronSize")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.wellApronMaterial.label" default="Well Apron Material"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "wellApronMaterial")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.wellApronCondition.label" default="Well Apron Condition"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "wellApronCondition")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.abstractionType.label" default="Abstraction Type"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "abstractionType")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.pumpStatus.label" default="Pump Status"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "pumpStatus")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.useOfWater.label" default="Use Of Water"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "useOfWater")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.householdUsage.label" default="Household Usage"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "householdUsage")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.peopleUsage.label" default="People Usage"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "peopleUsage")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.contaminationSource.label" default="Contamination Source"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "contaminationSource")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.contaminationDist.label" default="Contamination Dist"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "contaminationDist")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.diameterInternal.label" default="Diameter Internal"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "diameterInternal")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.parapetHeight.label" default="Parapet Height"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "parapetHeight")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.distanceToWaterTable.label"
                                             default="Distance To Water Table"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "distanceToWaterTable")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.totalDepth.label" default="Total Depth"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "totalDepth")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.salinityTop_mScm.label" default="Salinity Topm Scm"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "salinityTop_mScm")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.salinityBase_mScm.label" default="Salinity Basem Scm"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "salinityBase_mScm")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.bacteriological.label" default="Bacteriological"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "bacteriological")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.nitrateNitrite.label" default="Nitrate Nitrite"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "nitrateNitrite")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.wellImprovements1.label" default="Well Improvements1"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "wellImprovements1")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.wellImprovements2.label" default="Well Improvements2"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "wellImprovements2")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.wellImprovements3.label" default="Well Improvements3"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "wellImprovements3")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.comments.label" default="Comments"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "comments")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.photo.label" default="Photo"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "photo")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.reportPhoto.label" default="Report Photo"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "reportPhoto")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.date.label" default="Date"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "date")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.time.label" default="Time"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "time")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.team.label" default="Team"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "team")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.longitude.label" default="Longitude"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "longitude")}</td>

</tr>

<tr class="prop">
    <td valign="top" class="name"><g:message code="well.latitude.label" default="Latitude"/></td>

    <td valign="top" class="value">${fieldValue(bean: wellInstance, field: "latitude")}</td>

</tr>

</tbody>
</table>

<div align="left">
    <div style="width: 260px; padding: 5px">
        <p style="color: gray; font-size: 18px">Download Report</p>
        <g:jasperReport jasper="well" format="PDF,DOCX,HTML,PPTX">
            <input type="hidden" name="report_id" value="${wellInstance?.id}"/>
        </g:jasperReport>
    </div>
</div>

</section>

</body>

</html>
