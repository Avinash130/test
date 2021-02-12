({
	handleCreateLoad : function(component, event, helper) {
		var pageRef = cmp.get("v.pageReference");
        var defaultFieldValues = 
            cmp.find("pageRefUtils").decodeDefaultFieldValues(pageRef.state.defaultFieldValues);
        var nameFieldValues = cmp.find("nameField").set("v.value", defaultFieldValues.Name);
        var nameFieldValues = cmp.find("numOfEmpField").set("v.value", defaultFieldValues.NumberOfEmployees);
        var nameFieldValues = cmp.find("ownerIdField").set("v.value", defaultFieldValues.OwnerId);
        var nameFieldValues = cmp.find("customCheckField").set("v.value", defaultFieldValues.CustomCheckbox__c === 'true');
        var nameFieldValues = cmp.find("navigationService").navigate({
            type: "standard__webPage",
            attributes: {
                url: 'http://salesforce.com'
            }
        });
	},
    
    init: function(cmp, event, helper) {
        
        var pageReference = cmp.get("v.pageReference");
        cmp.set("v.myAttr", pageReference.state.c__myAttr);
        // myAttr can be modified, but isn’t reflected in the URL
    }

})