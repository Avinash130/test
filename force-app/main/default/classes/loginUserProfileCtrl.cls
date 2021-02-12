public class loginUserProfileCtrl {
    @AuraEnabled
    public static user fetchUserDetail() {
        return [select id, name, SmallPhotoUrl, FullPhotoUrl from user 
               Where id = :Userinfo.getUserId()];
    }

}