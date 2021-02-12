global class OpportunityWrapper implements Comparable {
    public opportunity oppy;
    public OpportunityWrapper(Opportunity op){
        oppy = op;
    }
    global Integer compareTo(Object compareTo){
        OpportunityWrapper compareToOppy = (OpportunityWrapper)compareTo;
        Integer returnValue = 0;
        if(oppy.Amount>compareToOppy.oppy.Amount){
            returnValue=1;
        }else if(oppy.Amount<compareToOppy.oppy.Amount){
            returnValue = -1;
        }
        return returnValue;
    } 
}