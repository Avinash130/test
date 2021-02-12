global class AccountScheduleBatch51 implements Schedulable {
    global void execute(SchedulableContext sc) {
        AccountBatchApex51 aba = new AccountBatchApex51();
        Database.executeBatch(aba);
    }
}