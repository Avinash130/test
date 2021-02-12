trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    if(trigger.isBefore && trigger.isInsert) {
        AccountTriggerHandler.CreateAccounts(trigger.new);
    }

}