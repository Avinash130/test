({
	fetchContacts : function(component, event, helper) {
		var action = component.get("c.getContacts");
        var accountId = component.get("v.recordId");
        action.setParams({
            accounIds: accountId
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state === 'SUCCESS') {
                var contactList = response.getReturnValue();
                console.log(contactList);  
            } else {
                alert('Error in getting data');
            }
        });
        $A.enqueueAction(action);
	}
})