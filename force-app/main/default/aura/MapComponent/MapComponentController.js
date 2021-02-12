({
	doInit : function(component, event, helper) {
		var action = component.get("c.getMyMap");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS") {
                component.set("v.Newmap", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	},
})