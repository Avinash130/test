trigger SoqlTriggerBulk on Account (before insert) {

for(Opportunity opp : [select id, name, closedate from opportunity
                       where accountid IN : Trigger.New]){
                           
                       }
}