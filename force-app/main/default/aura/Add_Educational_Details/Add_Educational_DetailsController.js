({
	deleteDetails : function(component, event, helper) {
		var NewEducationdetailsList = component.get("v.EducationDetailListInnerComponent");
        var currentIndex = component.get("v.indexNo");
        if(currentIndex > -1) 
            NewEducationdetailsList.splice(currentIndex, 1);
            component.set("v.EducationDetailListInnerComponent", NewEducationdetailsList);
        
	},
    
    doinit : function(cmp,event, helper) {
        console.log('This text is from init method defined in child component');
        // helper.helperRecifySequence(component, event, helper);
    },
    
    changeInIndexNo : function(cmp, event, helper) {
        alert('There is change noticed in indexNo attribute');
        helper.helperRecifySequence(component, event);
    },
    
    saveEduDetails : function(component, event, helper) {
       
      // call apex class function with name 
      // saveEducationalDetail
      var RegistrationRecordId = component.get("v.RegistrationRecordId");
        component.set("v.EduDetails.Registration_From__c",RegistrationRecordId);
        var EduDetails = component.get("v.EduDetails");
        var actn = component.get("c.SaveEducationalDetails");
        actn.setParams({EduDet : EduDetails});
        actn.setCallback(this, function(resp) {
            var state = resp.getState();
            if(state === "SUCCESS") {
                console.log('Add Educatioal Detail is saved');
            } else if(state === "ERROR") {
              console.log('dsd');
                console.log('EduDetails');
                var errors = resp.getError();
                if(errors) {
                    if(errors[0] && errors[0].message) {
                        console.log('Error message: ' + errors[0].message);
                    }
                } else {
                    console.log('Unknown error');
                }
            }
        });
        $A.enqueueAction(actn);
    }
})