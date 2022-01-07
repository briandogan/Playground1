@isTest
public with sharing class TestPageControllerTest {
    // Places to create Test Data.
    // 1. In the @testSetup.
    // 2. Inside the TestMethod
    // 3. In the CSV File.
    // If you don't want to create test data inside the Test class then add @isTest(Seealldata = true) before the testclass/testmethod. 
    //***It is not Preffered***
    
    @testSetup
    public static void testData(){
        Account accObj = new Account();
        accObj.Name = 'Test account';
        INSERT accObj;
        
        List<sObject> accounts = Test.loadData(Account.SObjectType, 'accountRecords');
        
        Contact contObj = new Contact();
        contObj.FirstName = 'test';
        contObj.LastName = 'Data';
        contObj.AccountId = accObj.Id;
        INSERT contObj;
    }
    
    @isTest
    public static void testUnitOne(){
        List<account> accountList = [SELECT Id FROM Account];
        System.assert(accountList.size() ==4 );
        Contact contObj = [SELECT Id, FirstName 
                           FROM Contact 
                           WHERE LastName = 'Data' 
                           LIMIT 1];
        ApexPages.StandardController sc = new ApexPages.StandardController(contObj);
        
        TestPageController controllerObj = new TestPageController(sc);
        //System.assert
        //System.assert(controllerObj.contObj.Id != NULL);
        //
        //
        //test.startTest(); and test.stopTest();
        //1. When we have to test Asynchronous(Future, Batch, Queuable, and Schedular)
        //2. When in any testMethod, we hits the governer LIMIT. because it reset the Governer Limits.
    }
    
    @isTest
    public static void testUnitTwo(){
        Account accObj = [
            SELECT Id
            FROM Account
            WHERE Name = 'Test account'
            LIMIT 1
        ];
        Contact contObj = [SELECT Id, FirstName 
                           FROM Contact 
                           WHERE LastName = 'Data' 
                           LIMIT 1];
        ApexPages.StandardController sc = new ApexPages.StandardController(contObj);
        TestPageController controllerObj = new TestPageController(sc);
        controllerObj.updateContact(accObj.Id);
        
        Contact contNewObj = [SELECT Id, FirstName
                              FROM Contact
                             WHERE AccountId = :accObj.Id
                             LIMIT 1];
        //System.assert(contNewObj.FirstName == 'Update from Class');
    }
}