//WHY Future Methods:
///***0. When we have to Performing DML on Setup object, and just after the 
//   we need to make DML on Non-Setup Object.*****
//1. We need to make a real time Sync between the Salesforce and Legacy system, 
//   and trigger have to make callout, at that moment, making callout from 
//   trigger is not possible, so we take the help of @future to make this happens.
//2. Just after the DML, we have to make a callout, and this is not possible, so 
//   we have to help of Future to make the callout just after the DML.
//
//Pros:
//1. Make any static method to run in async,
//2. Reset the governer limit count.
//
//Cons:
//1. it will not support sobject as a Parameter.
//2. we can call 50 Future methods in single transaction.
public class AsyncApexOne {
    public static void testAsyncProcess(){
        Profile profileId = [SELECT Id 
                             FROM Profile 
                             WHERE Name = 'Standard User' 
                             LIMIT 1
                            ];        
        User userObj = new User(
            LastName = 'testUser',
            FirstName='test',
            Alias = 'test',
            Email = 'UserTest@abc.com',
            Username = 'UserTestsuraj051@abc.com',
            ProfileId = profileId.id,
            TimeZoneSidKey = 'GMT',
            LanguageLocaleKey = 'en_US',
            EmailEncodingKey = 'UTF-8',
            LocaleSidKey = 'en_US'
        );
        insert userObj;
        
        Account accObj = new Account();
        accObj.name = 'tes';
        accObj.OwnerId = userObj.Id;
        INSERT accObj;
        
    }
    
    @future
    public static void testFutureMethod(){
        //WRITE CODE HERE.
        System.debug('I AM IN FUTURE METHOD');
    }
    
    
    public static void testMyMethod(){
        //WRITE CODE HERE.
        System.debug('I AM IN NORMAL METHOD');
    }
}