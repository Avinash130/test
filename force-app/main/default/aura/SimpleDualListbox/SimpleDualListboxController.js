({
	handleChange : function(component, event, helper) {
		var selectedOptionValue = event.getParam("value");
        alert("Option selected with value: '" + selectedOptionValue.toString() + "'")
	}
});