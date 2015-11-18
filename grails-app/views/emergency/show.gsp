

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'emergency.label', default: 'Emergency')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-emergency" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-emergency" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list emergency">
			
				<g:if test="${emergencyInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="emergency.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${emergencyInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${emergencyInstance?.steps}">
				<li class="fieldcontain">
					<span id="steps-label" class="property-label"><g:message code="emergency.steps.label" default="Steps" /></span>
					
						<span class="property-value" aria-labelledby="steps-label"><g:fieldValue bean="${emergencyInstance}" field="steps"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${emergencyInstance?.symptoms}">
				<li class="fieldcontain">
					<span id="symptoms-label" class="property-label"><g:message code="emergency.symptoms.label" default="Symptoms" /></span>
					
						<g:each in="${emergencyInstance.symptoms}" var="s">
						<span class="property-value" aria-labelledby="symptoms-label"><g:link controller="symptom" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:emergencyInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${emergencyInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
