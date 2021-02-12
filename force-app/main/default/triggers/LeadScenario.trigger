trigger LeadScenario on Lead (before insert, before update) {
    for(Lead l : trigger.new) {
        if(l.LeadSource == 'Web'){
            l.Rating = 'Cold';
        }
        else {
            l.Rating = 'Hot';
        }
    }
}