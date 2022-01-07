public with sharing class HelloWorldController2 {
    public HelloWorldController2() {
       
    }

    @AuraEnabled(cacheable=true)
    public static string callApexWire(String param){
        try {
            return 'This is the text from APEX Call (WIRE) with param ' + param;                
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }   

    @AuraEnabled
    public static string callApexImperative(String param){
        try {
            return 'This is the text from APEX Call (IMPERATIVE) with param ' + param;                
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }   
}