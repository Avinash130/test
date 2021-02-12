({
	doInit : function(component, event, helper) {
		var action = component.get('c.fetchAccount');
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS") {
                component.set('v.ListOfAccount', response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	}
})