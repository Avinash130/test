trigger accountafterhandler on Account (after insert) {
   List<Contact> contacts = new List<Contact>();
    for(Account acc : trigger.New) {
        if(acc.Industry == 'Banking') {
            Contact con = new Contact();
            con.LastName = acc.Name;
            con.Phone = acc.Phone;
            con.AccountId = acc.Id;
            contacts.add(con);
        }
    }
    insert contacts;
}