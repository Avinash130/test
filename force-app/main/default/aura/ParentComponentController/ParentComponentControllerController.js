({
	callAuraMethod : function(component, event, helper) {
		var childComponent = component.find("childCmp");
        var messasge = childComponent.childMessageMethod();
	}
})