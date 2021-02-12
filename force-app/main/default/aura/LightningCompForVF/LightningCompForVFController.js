({
    doAction : function(component, event, helper) {
        var msgForVf="Hi This message was pass from component to me and I am VF page displaying this message";
        var vfMethod=component.get("v.VfPageMethod");
        // Calling Vf page method
        vfMethod(msgForVf,function()
                 {
                     
                     
                     
                 });
    }
})