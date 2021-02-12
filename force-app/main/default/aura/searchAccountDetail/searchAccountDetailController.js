({
    findAccount: function(component, event, helper) {
        var action = component.get('c.fetchAccount');
        action.setParams({
            searchKeyWord: component.get("v.keywordHolder")
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            var response1 = response.getReturnValue();
            if (state === "SUCCESS") {
                component.set("v.accountList", response1);
            }
        });
        $A.enqueueAction(action);
    },
    showDetails: function(component, event, helper) {
        var eventSource = event.getSource();
        var accId = eventSource.get('v.name');
        var modalBody;
        $A.createComponent("c:ShowCompleteAccountDetail", {
            "accountId": accId
        }, function(content, status) {
            if (status === 'SUCCESS') {
                modalBody=content;
                //alert('Inside success');
                component.find("overlayLib").showCustomModal({
                       header: "Account Detail",
                       body: modalBody, 
                       showCloseButton: true,
                       closeCallback: function() {
                           alert('You closed the alert');
                       }
                })
            }
        });
    }
})