public class JSON2Apex {

	
public List<Convo> convo;
	
public String schedule;
	
public String schedule_date;
	
public Integer dnc;
	
public String inbound_sms_id;
	
public String twilio_number;
	
public String last_sentiment;

	
public class Convo {
		
public String action;
		
public String tooltip;
		
public String company_timezone;
		
public String direction;
		
public String status;
		
public String answered_by;		
public String to;
		
public String message;
		
public String duration;
		
public String sid;
		
public String schedule_date;
		
public String schedule_timezone;
		
public String date_closed;
	
}

	
	
public static JSON2Apex parse(String json) {
		
return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
	
}

}