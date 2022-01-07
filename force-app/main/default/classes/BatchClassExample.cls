//Batch class is used when we have large number of record to process.
//Each batch class contains three methods --> Start, Execute, Finish.
//
//START: This method to query the records from the salesforce database.
//EXECUTE: This method will process the number of Recrods. 
//			Number of recrods are depends on the batch size.
//FINISH: This method executes when all the EXECUTE batch are finished. 		
//
public class BatchClassExample implements Database.Batchable<sObject>{
    
    public Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'SELECT FirstName, Email FROM Contact WHERE CALENDAR_MONTH(Birthdate) = 12 AND DAY_IN_MONTH(Birthdate) = 10 AND Email != NULL ';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext BC, List<Contact> contactList){
        EmailTemplate template = [SELECT Id, Name, DeveloperName 
                                  FROM EmailTemplate 
                                  WHERE DeveloperName = 'HappyBirthday'];
        Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage>();
        for(Contact contactObj :contactList){
            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            message.toAddresses = new String[] { contactObj.Id, 'manna004@fiu.edu', 'anvarchary83@gmail.com', 'mrvepa93@gmail.com' };
            message.setTargetObjectId(contactObj.id);
            message.setSaveAsActivity(false);
            
            message.setTemplateID(template.Id);
            //message.setWhatId(contactObj.Id); 
            messages.add(message);
        }
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
    }
    
    public void finish(Database.BatchableContext BC){
    	//TODO CODE.
    }
}