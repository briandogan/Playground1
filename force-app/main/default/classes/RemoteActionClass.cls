public class RemoteActionClass {
	public String nonStaticVariable;
    public Static String staticVariable;
    
    public RemoteActionClass(ApexPages.StandardController controller) {

    }

	@RemoteAction //the function to be called in remote action should use this annotation
    public static list<Contact> getcon() {
        //function should be static and global else it will throw error
        list<Contact> con1 = [SELECT id,name FROM contact limit 5];
        if(con1!=null && !con1.isEmpty()){        
            return con1;        
        }else{        
            return  new list<contact>();        
        }
    }
}