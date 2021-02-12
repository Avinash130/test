trigger leadMainTrigger on Lead (before insert, before update) {
    validateLeadData obj = new validateLeadData();
    if(trigger.isBefore && trigger.isInsert){
        obj.method(trigger.new);
    }
    if(trigger.isBefore && trigger.isUpdate){
        obj.method(trigger.new);
    }
}