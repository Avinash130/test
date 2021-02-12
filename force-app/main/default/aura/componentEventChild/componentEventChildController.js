({
	onclick : function(component, event, helper) {
		// get the event 
		var event = component.getEvent("cmpEvent");
        
        //set the response value inside eventResponse of componentEvent attribute
        event.setParams({
            "eventResponse" : "This is response from child"
        });
        
        //fir eht event
        event.fire();
	}
})