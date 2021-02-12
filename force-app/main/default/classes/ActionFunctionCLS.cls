public class ActionFunctionCLS {

    public Account actObj{get;set;}
        PageReference prf=null;
   public ActionFunctionCLS()
   {
     actObj=new Account();
   }

    public PageReference Saverec() 
    {
       if(actobj.Name!=' ')
     {
      insert actobj;  
    }
    else
    {
    ApexPages.Message myMsg=new ApexPages.Message(ApexPages.Severity.ERROR,'Error:Please Enter Name.');
    ApexPages.addMessage(myMsg);
    }
    if(actobj.id!=null)
    {
    //send the user to detail Page for the new account.
   prf=new PageReference('/'+actobj.id);
   prf.setRedirect(true);
   }
   return prf;
   }
   }