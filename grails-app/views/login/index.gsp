<%@ page import="kiriwatsan.Well; kiriwatsan.Storage" %>
<html>

<head>

    <style>
        /* ----- simple input form ----- */
    .simpleform {
        margin: 0 auto 1.0em auto;
        width: 100%;
    }

    .simpleform fieldset {
        padding: 0.5em;

    }

    .simpleform legend {
        color: #004A7F;
        font-size: 1.4em;
        font-weight: normal;

    }

    .simpleform p {
        clear: left;
        margin-bottom: 1.0em;
    }

    .simpleform p.info {
        color: #666666;
        padding-bottom: 0.5em;
        border-bottom: 1px solid #b7ddf2;
        margin-bottom: 1.0em;
    }

    .simpleform label {
        float: left;
        width: 30%;
        text-align: right;

        font-weight: bold;
        margin-right: 1.0em;
    }

    .simpleform input {

        border: 1px solid #aacfe4;
    }

    .simpleform p.button {
        margin-bottom: 0em;
    }

    .simpleform p input.button {
        border: 1px solid #999999;
        border-color: #CCCCCC #CCCCCC #999999 #999999;
        display: inline;
        padding: 0.0em 0.5em 0.0em 0.5em;
        text-align: left;
    }

    .simpleform p input.button:hover {
        background: #FF9900;
        color: #FFFFFF;
    }

    .simpleform input:focus, .simpleform select:focus, .simpleform textarea:focus {
        border: 1px solid gray;
        color: #000000;
    }

    .simpleform p .errors {
        border: 1px solid red;
    }
    </style>

    <title>KiriWatSan - Water Resources Assessment</title>
    <meta name="layout" content="kickstart"/>
</head>

<body>

<section id="intro" class="first">
    <h1 style="font-variant: small-caps">What is Kiriwatsan?</h1>

    <p>Kiribati Water and Sanitation is an EU-funded bilateral water and sanitation project to improve safe and sustainable water and sanitation and reduce water related diseases in around 70 villages and 16 outer islands of the Kirbati Gilbert Group. KIRIWATSAN is an EF10 Project with UNICEF as the implementing agency with support from Government of Kiribati.
    For further information please contact <a href="mailto:peter@sopac.org">Peter Sinclair</a>.
    </p>

    <g:form class="simpleform" style="width:500px;" controller="login" action="doLogin" method="post">
        <fieldset>
            <legend>Login</legend>

            %{-- <p class="info">
                 Please login with your assigned username and password. <br/>
             </p>--}%
            %{--<g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>--}%
            <p>
                <label for="username">Username</label>
                <g:textField name="username"/>
            </p>

            <p>
                <label for="password">Password</label>
                <g:passwordField name="password"/>
            </p>

            <p class="button">
                <label>&nbsp;</label>
                <g:submitButton class="btn btn-primary" name="submitButton" value="Login"/>
            </p>
        </fieldset>
    </g:form>

</section>

</body>

</html>
