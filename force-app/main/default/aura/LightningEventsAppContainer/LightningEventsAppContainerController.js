({
	handleApplicationEvent : function(component, event, helper) {
		var id = component.get('v.id');
        alert('Application Event in container component' +id);
        componen.set('v.message', event.getParam("Message"));
	}
})