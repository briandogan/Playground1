public class GoRestComponentController {

    @auraEnabled(cacheable = true)
    public static String getAllUser(){
        try{
            return JSON.serialize(GoRestRequestController.getAllUser());
        }catch(exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }
    
    @auraEnabled
    public static String createNewUser(String email){
        try{
            return JSON.serialize(GoRestRequestController.createUser(email).data);
        }catch(exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }
}