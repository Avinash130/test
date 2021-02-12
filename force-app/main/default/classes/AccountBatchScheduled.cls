global class AccountBatchScheduled implements Schedulable{
    global void execute(SchedulableContext sc) {
        AccountBatch objBatch = new AccountBatch();
        Database.executeBatch(objBatch);
    }
}