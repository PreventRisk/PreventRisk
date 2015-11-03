<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="login-form"/>
	<title>Welcome to PreventRisk</title>
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
		<div style="margin-top:20px">
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
			> Ahora puede acceder a Prevent Risk</g:link></li>

		</ul>
	</g:if>
	<g:else>
		<div id="registerPane">
			Need an account?
			<g:link controller="user"
					action="register">Signup now</g:link>
		</div>
	</g:else>
</div>
</body>
</html>
