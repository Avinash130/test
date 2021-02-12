({
    getMessage : function(component, event, helper) {
        var params = event.getParam('arguments');
        if(params) {
            var Param1 = params.childGreetingParam;
            var Param2 = params.childPersonNameParam;
            alert(Param1 + " " + Param2);
        }
    }
})