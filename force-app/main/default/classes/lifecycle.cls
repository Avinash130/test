public with sharing class lifecycle {
    private final Account acct;
    Integer EmpAdd;
    
    public lifecycle(myController controller) {
        this.acct = (Account)controller.getAccount();
    }
    
    public String getGreeting() {
        return acct.Name + ' Curretn Information ';
    }
    
    public void resetEmp() {
        acct.NumberOfEmployees = 10;
        update acct;
    }
}