public class AccountUtility {
    public static void viewAnnualRevenue() {
        List<Account> accountsList = [Select Name, Annualrevenue FROM Account];
        for(Account a : accountsList) {
             string  acctRev = a.Name +':'+ a.AnnualRevenue ;
            system.debug(acctRev);
        }
    }

}