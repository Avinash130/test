public class Tea {
    public static String orderTea(){
        Map<String, String> teaTypes = new Map<String, String>();
        teaTypes.put('Black', 'Earthy');
        teaTypes.put('White', 'Sweets');
        teaTypes.put('Herbal', 'Sweets');
        String flavorProfile = teaTypes.get('Herbal');
        System.debug('The flavorProfile of Herbal is : ' + flavorProfile);
        return flavorProfile;
    }
}