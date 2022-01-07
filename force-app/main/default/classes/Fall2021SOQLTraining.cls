public class Fall2021SOQLTraining {
    
    public void FillList(){
        List<Contact> contactList = new List<Contact>();
        contactList = [SELECT Id, FirstName, LastName FROM Contact limit 10];        
    }
}