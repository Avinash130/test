public class MyHelloWorld 
{
  public static void ApplyDiscount(Book__c [] books){
   for(Book__c b : books){
   b.price__c *= 0.9;
}
}
}