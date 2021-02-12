({
	handleEvent : function(component, event, helper) {
        // get response value fired from parent component
		var response = event.getParam("eventResponse");
        
        // set the value recieved from the event
         component.set("v.eventValue", response);
	}
})