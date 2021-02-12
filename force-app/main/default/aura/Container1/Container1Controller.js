({
	sendMessage : function(component, event, helper) {
        var msg = {
            name: "General" ,
            value: component.get("v.messageReceived", value)
        };
        component.find("AngularApp").message(msg);
	}
})