public class ContactAndLeadSearch {
    public ContactAndLeadSearch() {

    }

    public static List<List<SObject>> searchContactsAndLeads(string searchParam)
    {
        // TEST DATA
        // Add account 
        /*Contact con = new Contact(
            FirstName='Fatih',
            LastName='Smith',
            Phone='(415)555-1212',
            Department='Wingo');
        insert con;*/

        // Add lead 
        /*Lead lead = new Lead(
            FirstName='Hatice',
            LastName='Smith');
        insert lead;*/

        List<List<SObject>> search = [FIND :searchParam IN ALL FIELDS RETURNING Contact (FirstName,LastName), Lead(FirstName,LastName)];
        return search;
    }
}
