({
	doHandleEvent : function(component, event, helper) {
		var cmpEvent = component.getEvent("regInChild");
        cmpEvent.setParams({
            storeMessage : component.get("v.textMessage")
        });
            cmpEvent.fire();
	}
})