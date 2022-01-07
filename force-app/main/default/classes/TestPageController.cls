public with sharing class TestPageController{
	Public Contact contObj{get;set;}
    public TestPageController(ApexPages.StandardController controller) {
        List<Contact> contactList = new List<Contact>();
        contactList = getContactlist();
        if(contactList.size() > 0){
            contObj = contactList.get(0);
        }
    }
    
    private static List<Contact> getContactlist(){
        return [
            SELECT Id, Name,FirstName, LastName
            FROM Contact
        ];
    }
    
    public void updateContact(String accountId){
        List<Contact> contactList = new List<Contact>();
        contactList = [
            SELECT Id, Name,FirstName, LastName
            FROM Contact
            WHERE AccountId = :accountId
        ];
        if(contactList.size() > 0){
            for(Contact contObj :contactList){
                contObj.FirstName = 'Update from Class';
            }
            UPDATE contactList;
        }
        
    }
}