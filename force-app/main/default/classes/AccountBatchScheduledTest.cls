@isTest
public class AccountBatchScheduledTest {
    static testmethod void schedulerTest() {
        String cronexpression = '0 0 0 15 3 ? *';
        
        Account acc = new Account();
        acc.Name = 'Test Avinash';
        try{
            insert acc;
        } catch(Exception e){
            System.debug(e.getMessage());
        }
        Test.startTest();
        String jobId = System.schedule('ScheduleBatchApexClass',  cronexpression, new AccountBatchScheduled());
        CronTrigger ct  = [select Id, CronExpression, TimesTriggered, NextFireTime From CronTrigger Where Id = :jobId];
        System.assertEquals(cronExpression, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
        Test.stopTest();
    }
}