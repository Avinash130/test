public class AccountUtils {
    public static List<Account> accountsByState(String st) {
        List<Account> accList = [select id, name from account where BillingState = :st];
        return accList;
    }

}