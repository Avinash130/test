({
	onClickCheckBoxhelper : function(component) {
		// Body Of Helper
		// define your logic in this function
		console.log("This Text is From Helper function");
        var checkBoxValue = component.find("checkBox").get("v.checked");
         component.set("v.checkBoxValue",checkBoxValue);
        component.set("v.RegForm.Available_on_weekends__c",checkBoxValue);
	}
})