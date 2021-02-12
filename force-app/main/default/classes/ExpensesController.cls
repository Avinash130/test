public class ExpensesController {
   @AuraEnabled
    public static List<Expense__c> getExpenses(){
        return [SELECT Id, Name, Amount__c, Client__c, Date__c,
               Reimbursed__c, createdDate
               FROM Expense__c];
    }
    @AuraEnabled
    public static Expense__c saveExpense(Expense__c expense){
        // Perform isUpdataable() cheking first, then
        upsert expense;
        return expense;
    }
}