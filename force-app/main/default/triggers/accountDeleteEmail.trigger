trigger accountDeleteEmail on Account (after Delete) {
 List<Messaging.Email> emails=new List<Messaging.Email>();
    for(Account a:Trigger.Old){
        Messaging.SingleEmailMessage email1=new Messaging.SingleEmailMessage();
        email1.setToAddresses(new String[]{a.Email__c});
        email1.setSubject('Account  Deleted');
        String body='<h1><b> Dear Cusomer</b></h1><p >Your Account with Accoutn Id:'+a.id;
        body=body+' is successfully deleted </p><br/><p> Thanks <br/>SalesTeam</p>';
        email1.setHtmlBody(body);
        emails.add(email1);
    }
    Messaging.sendEmail(emails);
}