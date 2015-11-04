<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="login-form"/>
    <title>PreventRisk LogIn</title>
    <style type="text/css" media="screen">
    #status {
        background-color: #eee;
        border: .2em solid #fff;
        margin: 4em 4em 2em;
        padding: 1em;
        width: 12em;
        float: left;
        -moz-box-shadow: 0px 0px 1.25em #ccc;
        -webkit-box-shadow: 0px 0px 1.25em #ccc;
        box-shadow: 0px 0px 1.25em #ccc;
        -moz-border-radius: 0.6em;
        -webkit-border-radius: 0.6em;
        border-radius: 0.6em;
    }

    .ie6 #status {
        display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
    }

    #status ul {
        font-size: 0.9em;
        list-style-type: none;
        margin-bottom: 0.6em;
        padding: 0;
    }

    #status li {
        line-height: 1.5;
    }

    #status h1 {
        text-transform: uppercase;
        font-size: 1.1em;
        margin: 0 0 0.3em;
    }

    #page-body {
        margin: 2em 1em 1.25em 18em;
    }

    h2 {
        margin-top: 1em;
        margin-bottom: 0.3em;
        font-size: 1em;
    }

    p {
        line-height: 1.5;
        margin: 0.25em 0;
    }

    #controller-list ul {
        list-style-position: inside;
    }

    #controller-list li {
        line-height: 1.3;
        list-style-position: inside;
        margin: 0.25em 0;
    }

    @media screen and (max-width: 480px) {
        #status {
            display: none;
        }

        #page-body {
            margin: 0 1em 1em;
        }

        #page-body h1 {
            margin-top: 0;
        }
    }
    </style>
</head>
<body>

<div id="greetingsPane">
    <g:if test="${!session.user}">
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;Bienvenido, para iniciar sesión en PreventRisk...
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;Tan solo necesitas tu usuario y contraseña únicas
        <br><br>
    </g:if>
</div>

<div id="loginBox" class="loginBox">
    <g:if test="${session?.user}">
        <div style="margin-center:40px">
            <div style="float:right;">
                <a href="#">Profile</a> | <g:link controller="user"
                                                  action="logout">Logout</g:link><br>
            </div>
        </div>
    </g:if>
    <g:else>
        <g:form
                name="loginForm"
                url="[controller:'user',action:'dologin']">
            <div>Username:</div>
            <g:textField name="login"
                         value="${fieldValue(bean:loginCmd, field:'login')}">
            </g:textField>
            <div>Password:</div>
            <g:passwordField name="password"></g:passwordField>
            <br/>
            <input type="image"
                   src="${createLinkTo(dir:'images', file:'login.jpg')}"
                   name="loginButton" id="loginButton" border="0"/>
        </g:form>
        <g:renderErrors bean="${loginCmd}"></g:renderErrors>
    </g:else>
</div>

<div id="navPane">
    <g:if test="${session.user}">
        <ul>
            <li><g:link controller="home"
            > Accede ahora a PreventRisk</g:link></li>

        </ul>
    </g:if>
    <g:else>
        <div id="registerPane">
            Todavía no te has registrado?
            <g:link controller="user"
                    action="register">Únete acá</g:link>
        </div>
    </g:else>
</div>
</body>
</html>
