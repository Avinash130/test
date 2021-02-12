trigger OrderEventTrigger on Order_Event__e (after insert) {
// List to hold all tasks to be created.
List<Task> tasks = new List<Task>();
    // Get queue Id for case owner
    String userId = userInfo.getUserId();
    // Iterate through each notification.
    for(Order_Event__e event : trigger.New) {
        if(event.Has_Shipped__c == true) {
             // Create Task to dispatch new team.
             Task ts = new Task();
            ts.Priority = 'Medium';
                ts.Subject = 'Follow up on shipped order ' +
                                  event.Order_Number__c;
                ts.OwnerId = userId;
            tasks.add(ts);
        }
    }
    insert tasks;
}