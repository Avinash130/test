({
	findAccount : function(component, event, helper) {
		var action = component.get('c.fetchAccount');
        
        action.setParams({
            searchKeyWord : component.get("v.keywordHolder")
        });
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            var response1 = response.getReturnValue();
            if(state === "SUCCESS") {
                component.set("v.accountList", response1);
            }
        });
        $A.enqueueAction(action);
	}
})