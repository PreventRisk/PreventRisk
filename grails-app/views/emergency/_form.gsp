



<div class="fieldcontain ${hasErrors(bean: emergencyInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="emergency.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${emergencyInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: emergencyInstance, field: 'steps', 'error')} required">
	<label for="steps">
		<g:message code="emergency.steps.label" default="Steps" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="steps" required="" value="${emergencyInstance?.steps}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: emergencyInstance, field: 'symptoms', 'error')} required">
	<label for="symptoms">
		<g:message code="emergency.symptoms.label" default="Symptoms" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="symptoms" from="${Symptom.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${emergencyInstance?.symptoms*.id}" class="many-to-many"/>

</div>

