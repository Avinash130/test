public class AddPrimaryContact implements Queueable {
    private Contact c;
    private String state;
    public AddPrimaryContact(Contact c, String state) {
        this.c = c;
        this.state = state;
    }
    public void execute(QueueableContext context) {
        List<Account> lstAccount = [select id, name, (select id, firstname, lastname from contacts) from account Where billingState = :state
                                   Limit 200];
        List<Contact> lstContact = new List<Contact>();
        for(Account acc : lstAccount) {
            Contact cont = c.clone(false, false, false, false);
            cont.AccountId = acc.id;
            lstContact.add(cont);
        }
        if(lstContact.size() > 0) {
            insert lstContact;
        }
    }
}