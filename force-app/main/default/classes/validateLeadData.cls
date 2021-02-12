public class validateLeadData {
    public void method(List<Lead> lstLead) {
        for(Lead obj : lstLead) {
            if(obj.Status == 'Closed - Converted') {
                obj.addError('You can not create or update the lead when status is Closed - Converted.Please select other status.');
            }
        }
    }
}