// ASSIGNMENT 2:
// Create a Field on the Account called "Create Primary Contact"(checkbox).
// Design a trigger on the Account such that, when a Account is inserted and 
// "Create Primary Contact" == True, then Create a new Contact recrod 
// with FirstName = 'Primary' Last Name = Account.Name, AccountId = Account.Id
trigger AccountCreatedTrigger on Account (after insert)
{
    List<Contact> contactList = new List<Contact>();
    for(Account account : trigger.new)
    {
        if(account.Create_Primary_Contact__c == true)
        {
            Contact contact = new Contact();
            contact.FirstName = 'Primary';
            contact.LastName = account.Name;
            contact.AccountId = account.Id;
            contactList.add(contact);
        }
    }
    
    INSERT contactList;
}