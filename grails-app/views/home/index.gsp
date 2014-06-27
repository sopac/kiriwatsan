<%@ page import="kiriwatsan.Well; kiriwatsan.Storage" %>
<html>

<head>
    <title><g:message code="default.welcome.title" args="[meta(name: 'app.name')]"/></title>
    <meta name="layout" content="kickstart"/>
</head>

<body>

<section id="intro" class="first">
    <h1 style="font-variant: small-caps">What is Kiriwatsan?</h1>

    <p>Kiribati Water and Sanitation is an EU-funded bilateral water and sanitation project to improve safe and sustainable water and sanitation and reduce water related diseases in around 70 villages and 16 outer islands of the Kirbati Gilbert Group. KIRIWATSAN is an EF10 Project with UNICEF as the implementing agency with support from Government of Kiribati.
    For further information please contact <a href="mailto:peter@sopac.org">Peter Sinclair</a>.
    </p>



    <br/>

    <table align="center" class="table table-bordered">
        <tr>
            <td align="center" style="width: 30%; text-align: center"><button style="width: 240px"
                                                                              class="btn btn-primary"
                                                                              onclick="window.location = '${createLink(controller:'well')}'">Browse Wells</button>
            </td>
            <td align="center" style="width: 30%; text-align: center;">
                <select class="btn btn-primary" style="width: 310px; color: white"
                        onchange="window.location = '${createLink(controller: 'well', action: 'list')}?village=' + this.value">
                    <option>Browse Wells By Village</option>
                    <g:each in="${Well.executeQuery('select distinct w.villageName from Well w order by w.villageName')}"
                            var="v">
                        <option value="${v}">${v}</option>
                    </g:each>
                </select>
            </td>
            <td align="center" style="width: 30%; text-align: center">
                <select class="btn btn-primary" style="width: 310px; color: white"
                        onchange="window.location = '${createLink(controller: 'well', action: 'list')}?island=' + this.value">
                    <option>Browse Wells By Island</option>
                    <g:each in="${Well.executeQuery('select distinct w.island from Well w order by w.island')}"
                            var="v">
                        <option value="${v}">${v}</option>
                    </g:each>
                </select>
            </td>
        </tr>

        <tr>
            <td align="center" style="width: 30%; text-align: center"><button style="width: 240px"
                                                                              class="btn btn-primary"
                                                                              onclick="window.location = '${createLink(controller:'storage')}'">Browse Storage</button>
            </td>
            <td align="center" style="width: 30%; text-align: center;">
                <select class="btn btn-primary" style="width: 310px; color: white"
                        onchange="window.location = '${createLink(controller: 'storage', action: 'list')}?village=' + this.value">
                    <option>Browse Storage By Village</option>
                    <g:each in="${Well.executeQuery('select distinct w.villageName from Storage w order by w.villageName')}"
                            var="v">
                        <option value="${v}">${v}</option>
                    </g:each>
                </select>
            </td>
            <td align="center" style="width: 30%; text-align: center">
                <select class="btn btn-primary" style="width: 310px; color: white"
                        onchange="window.location = '${createLink(controller: 'storage', action: 'list')}?island=' + this.value">
                    <option>Browse Storage By Island</option>
                    <g:each in="${Well.executeQuery('select distinct w.island from Storage w order by w.island')}"
                            var="v">
                        <option value="${v}">${v}</option>
                    </g:each>
                </select>
            </td>
        </tr>

        <tr>
            <td align="center" style="width: 30%; text-align: center"><button style="width: 240px"
                                                                              class="btn btn-primary"
                                                                              onclick="window.location = '${createLink(controller:'building')}'">Browse Buildings</button>
            </td>
            <td align="center" style="width: 30%; text-align: center;">
                <select class="btn btn-primary" style="width: 310px; color: white"
                        onchange="window.location = '${createLink(controller: 'building', action: 'list')}?village=' + this.value">
                    <option>Browse Buildings By Village</option>
                    <g:each in="${Well.executeQuery('select distinct w.villageName from Building w order by w.villageName')}"
                            var="v">
                        <option value="${v}">${v}</option>
                    </g:each>
                </select>
            </td>
            <td align="center" style="width: 30%; text-align: center">
                <select class="btn btn-primary" style="width: 310px; color: white"
                        onchange="window.location = '${createLink(controller: 'building', action: 'list')}?island=' + this.value">
                    <option>Browse Buildings By Island</option>
                    <g:each in="${Well.executeQuery('select distinct w.island from Building w order by w.island')}"
                            var="v">
                        <option value="${v}">${v}</option>
                    </g:each>
                </select>
            </td>
        </tr>


        <tr>
            <td align="center" style="width: 30%; text-align: center"><button style="width: 240px"
                                                                              class="btn btn-primary"
                                                                              onclick="window.location = '${createLink(controller:'rainwaterHarvesting')}'">Browse Rainwater Harvesting</button>
            </td>
            <td align="center" style="width: 30%; text-align: center">
                <select class="btn btn-primary" style="width: 310px; color: white"
                        onchange="window.location = '${createLink(controller: 'rainwaterHarvesting', action: 'list')}?village=' + this.value">
                    <option>Browse Rainwater Harvesting By Village</option>
                    <g:each in="${Well.executeQuery('select distinct w.villageName from Storage w order by w.villageName')}"
                            var="v">
                        <option value="${v}">${v}</option>
                    </g:each>
                </select>
            </td>
            <td align="center" style="width: 30%; text-align: center">
                <select class="btn btn-primary" style="width: 310px; color: white"
                        onchange="window.location = '${createLink(controller: 'rainwaterHarvesting', action: 'list')}?island=' + this.value">
                    <option>Browse Rainwater Harvesting By Island</option>
                    <g:each in="${Well.executeQuery('select distinct w.island from Storage w order by w.island')}"
                            var="v">
                        <option value="${v}">${v}</option>
                    </g:each>
                </select>
            </td>
        </tr>
    </table>

    <div align="center">
        <h3 style="color: #0088cc;">Data Statistics</h3>
        <table style="text-align: left;">
            <tr>
                <td align="center" style="padding-right: 2px; font-weight: bold">
                    ${kiriwatsan.Well.list().size()}
                </td>
                <td style="text-align: right">Wells</td>
            </tr>
            <tr>
                <td align="center" style="padding-right: 2px; font-weight: bold">
                    ${kiriwatsan.Building.list().size()}
                </td>
                <td style="text-align: right">Buildings</td>
            </tr>
            <tr>
                <td align="center" style="padding-right: 2px; font-weight: bold">
                    ${Storage.list().size()}
                </td>
                <td style="text-align: right">Tanks</td>
            </tr>
            <tr>
                <td align="center" style="padding-right: 2px; font-weight: bold">
                    ${Well.executeQuery('select distinct w.villageName from Storage w order by w.villageName').size()}
                </td>
                <td style="text-align: right">Villages</td>
            </tr>
            <tr>
                <td align="center" style="padding-right: 2px; font-weight: bold">
                    ${Well.executeQuery('select distinct w.island from Storage w order by w.island').size()}
                </td>
                <td style="text-align: right">Islands</td>
            </tr>
        </table>
        <hr style="color: black !important; width: 220px"/>
        <g:if test="${session['admin'] == true}">
            <g:form controller="userAccount" action="list">
                <g:submitButton class="btn btn-primary" name="Manage Users">Manage Users</g:submitButton>
            </g:form>
        </g:if>
        <g:form controller="login" action="logout">
            <g:submitButton class="btn btn-primary" name="Logout">Logout</g:submitButton>

        </g:form>
        ${session['user']}
    </div>

</section>

</body>

</html>
