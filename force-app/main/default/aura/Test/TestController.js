({
	doInit : function(component, event, helper) {
		var action = component.get('c.initClass');
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS") {
                //set response value in objClassController attribute on component
                component.set('v.objClassController', response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	},
})