public class TestVisualForcePage {
    public Account accountObj{get; set;}
    
	public TestVisualForcePage()
    {
        LIST<Account> accountList = [SELECT NAME FROM ACCOUNT LIMIT 1];
        accountObj = accountList.get(0);
    }
}