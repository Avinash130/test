({
	validateContactForm : function() {
        var validContact = true;
        
        // Show error message if required fields are blank
        var allValid = component.find('contactField').reduce(function (validFields, inputCmp){
            inputCmp.showHelpMessageIfInvalid();
            return validFields && inputCmp.get('v.validity').valid;
        }, true);
        
        if(allValid) {
            // Verify we have an account ot attach it
            var account = component.get("v.account");
            if($A.util.isEmpty(account)) {
                validContact = false;
                console.log("Quick action context doesn't have a valid account.");
            }
        }
		return (validContact);
	}
})