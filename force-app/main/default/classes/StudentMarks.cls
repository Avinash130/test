global class StudentMarks implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String q = 'select Id, Name, Total_Marks__c, Pass__c From Student__c';
        return Database.getQueryLocator(q);
    }
    global void execute(Database.BatchableContext BC, List<Student__c> scope){
        Student__c stls = new Student__c();
        for(Student__c stu : scope){
            if(stu.Total_Marks__c > 40){
              stu.Pass__c = true;
            }
            
        }
    }
    global void finish(Database.BatchableContext Bc){
        
    }
}