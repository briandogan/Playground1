/**
 * String state;
String areaCode;
state = 'New York';
if(state == 'New York') {
    areaCode = 'NY';
}else if(state == 'Alaska'){
    areaCode = 'AK';
}else if(state == 'California'){
    areaCode = 'CA';
}
else{
    System.debug('invalid State');
}
*/
public class Fall21MapProblem {
    Map<String, String> areaCodeByState = new Map<String, String>{
        	'New York' => 'NY',
            'Alaska' => 'AK',
            'California' => 'CA'
    };
    String state;
    
    public Fall21MapProblem(){
        state = 'Alabama';
        if(areaCodeByState.containsKey(state)){
            //.containsKey is a property of Map that helps to Identify either the
            //map contains that value or NO.
            System.debug('Area Code: ' + areaCodeByState.get(state));
        }else{
            System.debug('invalid State');
        }
    }
}

/*******
 * Assignment 1:
 * Create a Map of Product Name and Product-Code. and 
 * add 11 Products in it along with the Product code.
 * 
 * Design code to remove a element from the Map.
 * 
 * Design code, that will show Product Name, on the basis of Product-Code.
 * 
 * Design code, that will check that 
 * If the Product Exist or No, for a particular Product Code.
 * */