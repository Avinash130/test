trigger ContactAction on Contact (before insert,before update) {
    if(trigger.isBefore && trigger.isInsert){
        ContactTriggerHandler.preventCreatePrimaryContactOnInsert(trigger.new);
    }
    if(trigger.isBefore && trigger.isUpdate){
          ContactTriggerHandler.preventPrimaryContactOnUpdate(trigger.newMap,trigger.oldMap);    
    }
}