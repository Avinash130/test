global class SalesforceConvoInfo
{
    public List<SFInstance> sfInstances{get;set;}
   
    public SalesforceConvoInfo()
    {
        String jsonString = '[{"convo": [{ "action": "sms","date": "2020-02-29 01:00:48+00:00","tooltip": "February 28, 2020, 05:00 PM","company_timezone": "US/Pacific","direction": "inbound","status": "received","answered_by": "","from_": "+19493120182","to": "+13029900742", "message": "who is this?","duration": "","sid": "SM28c165a94f02fdb2f51784de296d5ff3" },{ "action": "sms","date": "2020-02-29 01:02:56+00:00","tooltip": "February 28, 2020, 05:02 PM","company_timezone": "US/Pacific","direction": "outbound", "status": "delivered","answered_by": "","from_": "+19495582803","to": "+19493120182","message": "Roy, thanks for your interest TeleDrip, we look forward to providing you a next-gen SMS strategy. Would like you like to set up a call? Text Remove if you are not interested.","duration": "","sid": "SM702a5c021e2043059332681fcc3348e3"},{"action": "sms","date": "2020-02-29 01:06:32+00:00","tooltip": "February 28, 2020, 05:06 PM","company_timezone": "US/Pacific","direction": "inbound","status": "received","answered_by": "","from_": "+19493120182","to": "+19495582803","message": "who is this?","duration": "","sid": "SMf3741420a36fa0d99cef97e0902e1dde"},{"action": "sms","date": "2020-02-29 01:06:47+00:00","tooltip": "February 28, 2020, 05:06 PM","company_timezone": "US/Pacific","direction": "outbound","status": "delivered","answered_by": "","from_": "+19495582803","to": "+19493120182","message": "TeleDrip, the intelligent follow-up experts. Give us a call if your interested in leveraging our AI communications platform.","duration": "","sid": "SM4835f57b79704a5ca3eeb9f4eda7c6c5"},{"action": "schedule","date": "2020-02-29 01:07:16.482698+00:00","tooltip": "February 28, 2020, 05:07 PM","company_timezone": "US/Pacific","schedule_date": "February 28, 2020, 05:12 PM","schedule_timezone": "America/Los Angeles"}, {"action": "closed", "date": "2020-02-28 17:17:00.462387-08:00", "tooltip": "February 28, 2020, 05:17 PM","company_timezone": "US/Pacific","date_closed": "February 28, 2020, 05:17 PM"}],"schedule": "al8pgjd","schedule_date": "2020-02-28 05:12:16 PM","dnc": 0,"inbound_sms_id": "","twilio_number": "", "last_sentiment": ""}]';
        sfInstances = (List<SFInstance>) JSON.deserialize(jsonString, List<SFInstance>.class);
        sfInstances.sort();
} 
        global class SFInstance implements Comparable
    {
        public String action{get;set;}
        public String tooltip{get;set;}
        public String company_timezone{get;set;}
        public String direction{get;set;}
        public String status{get;set;}
        public String answered_by{get;set;}
        public String to{get;set;}
        public String message{get;set;}
        public String duration{get;set;}
       
        public Integer compareTo(Object ObjToCompare)
        {
            return action.CompareTo(((SFInstance)ObjToCompare).action);
        }
}
}