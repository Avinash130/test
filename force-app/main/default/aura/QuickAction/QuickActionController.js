({
	addContact : function(component, event, helper) {
		alert('AVI');
        var fName = component.get("v.FirstName");
        var lName = component.get("v.LastName");
        var action = component.get("c.insertContact");
        
        action.setParams({
            parentAccountId : component.get("v.recordId"),
            FirstName1 : component.get("v.FirstName"),
            LastName1 : component.get("v.LastName")
        });
        
        action.setCallbac(this, function(response) {
            var state = response.getState();
            if(state === 'SUCCESS');
            alert('Contact inserted successfully');
        });
        
        $A.enqueueAction(action);
	}
})