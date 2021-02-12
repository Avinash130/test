public inherited sharing class Inherited11SharingClass{

    public List<Contact> getAllTheSecrets(){

        return [SELECT Name FROM Contact];

    }

}