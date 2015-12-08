



<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'progress', 'error')} required">
	<label for="progress">
		<g:message code="course.progress.label" default="Progress" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="progress" value="${fieldValue(bean: courseInstance, field: 'progress')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'unit', 'error')} required">
	<label for="unit">
		<g:message code="course.unit.label" default="Unit" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="unit" required="" value="${courseInstance?.unit}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'users', 'error')} ">
	<label for="users">
		<g:message code="course.users.label" default="Users" />
		
	</label>
	<g:select name="users" from="${User.list()}" multiple="multiple" optionKey="id" size="5" value="${courseInstance?.users*.id}" class="many-to-many"/>

</div>

