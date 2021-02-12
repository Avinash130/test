({
    doSubmit : function(component, event, helper) {
        var RegForm = component.get("v.RegForm");
        
        // create a one time use instance of of Registration Detail action
        // in the server-side controller
        var action = component.get("c.SaveRegistraionDetails");
        action.setParams({regForm : RegForm});
        
        action.setCallback(this, function(response) {
            
            var state = response.getState();
            
            if(state === "SUCCESS") {
                alert('From Server:' + response.getReturnValue());
                var parentId = response.getReturnValue();
                component.set("v.RegistrationRecordId",parentId);
                // somehow I am able to call doSubmit method in ADD_Educational_Detail
                // 
            }
            
            else if(state === "Error") {
                var errors = response.getError();
                
                if(errors) {
                    if(errors[0] && errors[0].message) {
                        console.log('Error Messsage: ' + errors[0].message);
                    }
                } 
                else {
                    console.log('Unknoen Error');
                }
                $A.enqueueAction(action);
            }
        });
    },
    
    onClickCheckBox : function(component,event,helper) {
        //BodyOfTheFunction
        // Call function defined in the helper
        console.log("This Text is From Controller function");
        helper.onClickCheckBoxhelper(component);
    },
    
    addDetails : function(cmp,event,helper) {
        
        console.log('Add Educational Details..');
        var CurrentEducationdetailsList = cmp.get("v.EducationalDetailsList");
        var currentSize = parseInt(CurrentEducationdetailsList.length);
        console.log('currentsize');
        var NewSize = parseInt((currentSize) + 1);
        console.log('NewSize');
        CurrentEducationdetailsList.push(NewSize);
        cmp.set("v.EducationalDetailsList", CurrentEducationdetailsList);
        console.log('added');
        
    }
})