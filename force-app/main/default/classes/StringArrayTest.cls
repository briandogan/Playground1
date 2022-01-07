public with sharing class StringArrayTest {
    public StringArrayTest() {      

    }

    public static List<String> generateTestStringList()
    {
        List<String> stringList = new List<String>();
        stringList.Add('Test 0');
        stringList.Add('Test 1');
        stringList.Add('Test 2');
        stringList.Add('Test 3');
        stringList.Add('Test 4');
        stringList.Add('Test 5');
        return stringList;
    }

    public static List<String> generateStringArray(integer n)
    {
        List<String> stringListTest = new List<String>();
        for(integer i = 0; i < n; i++)
        {
            stringListTest.Add('Test ' + i);
        }
        //List<String> stringListTest = generateTestStringList();
		//stem.debug(stringListTest.get(n));
        return stringListTest;
    }
}