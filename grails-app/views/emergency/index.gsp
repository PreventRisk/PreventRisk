

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'emergency.label', default: 'Emergency')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-emergency" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-emergency" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'emergency.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="steps" title="${message(code: 'emergency.steps.label', default: 'Steps')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${emergencyInstanceList}" status="i" var="emergencyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${emergencyInstance.id}">${fieldValue(bean: emergencyInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: emergencyInstance, field: "steps")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${emergencyInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
