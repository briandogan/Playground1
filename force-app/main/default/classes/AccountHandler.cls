public class AccountHandler {
    public AccountHandler() {

    }
    public static Account insertNewAccount(string accountName)
    {
        try{
        Account acct = new Account(Name=accountName);
        INSERT acct;
        return acct;
        }
        catch (DmlException e) {
            System.debug('A DML exception has occurred: ' + e.getMessage());
            return NULL;
            // Test 1
        }
    }
}
