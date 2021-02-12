({
	doHandleFromChild : function(component, event, helper) {
		var valueFromEvent = event.getParam("storeMessage");
        component.set("v.parentMesage", valueFromEvent);
	}
})