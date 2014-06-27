<%@ page import="kiriwatsan.RainwaterHarvesting" %>
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
    </style>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'rainwaterHarvesting.label', default: 'RainwaterHarvesting')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<section id="show-rainwaterHarvesting" class="first">

    <table class="table">
        <tbody>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="rainwaterHarvesting.building.label" default="Building"/></td>

            <td valign="top" class="value"><g:link controller="building" action="show"
                                                   id="${rainwaterHarvestingInstance?.building?.id}">${rainwaterHarvestingInstance?.building?.encodeAsHTML()}</g:link></td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="rainwaterHarvesting.tanks.label" default="Tanks"/></td>

            <td valign="top" style="text-align: left;" class="value">

                <g:each in="${rainwaterHarvestingInstance.tanks}" var="t">
                    <g:link controller="storage" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link>
                    <br/>
                </g:each>

            </td>

        </tr>

        </tbody>

    </table>

</section>


<h3>Building</h3>

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

<g:render template="building" model="[buildingInstance: rainwaterHarvestingInstance.building]"></g:render>

<div align="left">
    <div style="width: 260px; padding: 5px">
        <p style="color: gray; font-size: 18px">Download Report</p>
        <g:jasperReport jasper="rain" format="PDF,DOCX,HTML,PPTX">
            <input type="hidden" name="report_id" value="${rainwaterHarvestingInstance?.building.id}"/>
        </g:jasperReport>
    </div>
</div>

%{--<g:if test="${rainwaterHarvestingInstance.tanks.size() != 0}">

    <h3>Tanks</h3>

    <ul class="nav nav-tabs">
        <g:each in="${rainwaterHarvestingInstance.tanks}" var="t">

            <li><a href="#">${t.tankID}</a>
            ${t.tankID}
            </li>

        </g:each>
    </ul>
</g:if>--}%
</body>

</html>
