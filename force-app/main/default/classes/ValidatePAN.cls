public class ValidatePAN {
    public Integer  CheckPANvalidation(string PAN){  
        Integer ret = 0;
        String msgs = '';
        
        Boolean Test = Pattern.matches('[A-Z]{3}[PCHFATBLJ]{1}[A-Z]{1}[0-9]{4}[A-Z]{1}',PAN);
        if(Test == false)
        {
           
            msgs = msgs + ret + ' Please fill in the PAN NUMBER in appropriate format.';
            system.debug('1. ' + msgs);
        }
        return ret;
    }

}