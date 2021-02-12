public class SamplePoller
{

    public PageReference incremenCounter() {
        return null;
    }


    public String getCounter() {
        return null;
    }

//public Integer count{get;set;}
Integer count=0;
public Integer getcount()
{
  return count;
}
public Pagereference incrementCounter()
{
   count++;
   return null;
}
}