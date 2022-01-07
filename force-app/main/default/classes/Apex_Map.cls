public class Apex_Map {
    public Apex_Map(){
        Map<Integer, String> map1 = new Map<Integer, String>();
        map1.put(1, 'Fatih');
        map1.put(2, 'Hatice');
        map1.put(3, 'Akif');
        map1.put(4, 'Furkan');
        
        // map1.put(3, 'HasanAkif'); -- It overwrites
        // map1.remove(3);
        // map1.clear();
        // map1.containsKey(3);
        // map1.containsValue('Furkan');
        // map1.size();
        // map1.replace(3, 'Hasan Akif Dogan');
        // map1.toString();
        
        for(integer index: map1.keySet())
        {
            System.debug(index);
            System.debug(map1.get(index));
        }
        
        for(string value: map1.values())
        {
            System.debug(value);
        }
        
        // Second way of adding values
         Map<string, string> statesArea = new Map<string, string>{
        	'NY' => 'New York',
         	'CA'=> 'California',
          	'AK'=> 'Alaska'           
    	};
        
        if(statesArea.containsKey('NY'))
        {
            System.debug(statesArea.get('NY'));
        }
        
        /*******
         * Assignment 1:
         * Create a Map of Product Name and Product-Code. and 
         * add 11 Products in it along with the Product code.
         * Design code to remove a element from the Map.
         * Design code, that will show Product Name, on the basis of Product-Code.
         * Design code, that will check that If the Product Exist or Not
         * *****/
        
        Map<string, string> productMap = new Map<string, string>();
        // Add 11 products
        for(Integer i = 0; i < 11; i++)
        {
            productMap.put('PCode_' + i, 'PName_' + i);
        }
        System.Debug(productMap.toString());
        
        // Remove element
        if(productMap.containsKey('PCode_10'))
            productMap.remove('PCode_10');
        System.Debug(productMap.toString());
        
        // Show on basis of code
        for(string code : productMap.keySet())
            System.Debug('Code: ' + code + '- Value: ' + productMap.get(code));
        
        // Check a code exists or not
        String code = 'PCode_7';
        if(productMap.containsKey(code))
            System.Debug('Result: ' + code + ' exists');
        else
            System.Debug('Result: ' + code + ' DOES NOT exist');
    }   
}