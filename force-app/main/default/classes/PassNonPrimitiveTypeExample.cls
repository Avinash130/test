public class PassNonPrimitiveTypeExample {
    public static void createTemperatureHistory() {
        List<Integer> fillme = new List<Integer>();
        reference(fillme);
        //the list is modified and contains five items
        //as expected
        System.assertEquals(fillMe.size(),5);
        
        List<Integer> createme = new List<Integer>();
        referenceNew(createme);
        //the list is not modified it still points
        //to the  originals, not the new lists
        //that the method created.
        System.assertEquals(createme.size(), 0); 
    }
    public static void reference(List<Integer> m) {
        //add rounded temperature for last five days.
        m.add(70);
        m.add(68);
        m.add(75);
        m.add(80);
        m.add(82);
    }
    public static void referenceNew(List<Integer> m) {
        //assign argument to a new List of
        ///five temperature values.
        m = new List<Integer>{55, 59, 62, 60, 63 };
            
    }
}