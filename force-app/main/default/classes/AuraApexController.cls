public class AuraApexController {

    @AuraEnabled
    public static List<Contact> getContacts(){
        return [
            SELECT Id, Name
            FROM Contact
            LIMIT 10
        ];
    }
}