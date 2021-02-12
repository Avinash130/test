({
	doInit : function(component, event, helper) {
        
        //prepare the action to load the account record
        var action = component.get("c.getAccount");
        action.setParams({"accountId": component.get("v.recordId")});
        
        // Configure response handler
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS") {
                component.set("v.account", response.getReturnValue());
            } else {
                console.log('Problemgetting account, response state: ' + state);
            }
        });
        $A.enqueueAction(action);
	},
    
    handleSaveContact : function(component, event, helper) {
        if(helper.validateContactForm(component)) {
            
            // Prepare the action to create the new contact
            var saveContactAction = component.get("c.saveContactWithAccount");
            saveContactAction.setParams({
                "contact": component.get("v.newContact"),
                "accountId": component.get("v.recordId")
            });
            
            saveContactAction.setCallback(this, function(response){
                var state = response.getState();
                if(state === "SUCCESS") {
                    
                    // Prepare a toast UI message
                    var resultsToast = $A.get("e.force:showToast");
                    resultsToast.setParams({
                        "title": "Contact Saves",
                        "message": "the new contact was created."
                    });
                    
                    // Update the UI: close panel, show tosat, refresh account page
                    $A.get("e.force:closeQuickAction").fire();
                    resultsToast.fire();
                    $A.get("e.force:refreshView").fire();
                } else if (state === "ERROR") {
                    console.log('Problem saving contact, response state: ' + state);
                }
                    else {
                        console.log('Unknown problem, response state: ' + state);
                }
            });
            $A.enqueueAction(saveContactAction);
        }
    },
    handleCancel: function(component, event, helper) {
        $A.get("e.force:closeQuickAction").fire();
    }
})