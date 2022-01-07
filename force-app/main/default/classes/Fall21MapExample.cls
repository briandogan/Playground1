//MAP
//Map is combination of Key and Value. 
public class Fall21MapExample {
	//Declaration of Variable.
	//Syntax of Map: Map<Datatype1, DataType2> varaibleName = new Map<Datatype1, DataType2>();
	//Datatype1 --> Key
	//Datatype2 --> value
	//varaibleName --> valueBykey
	//Example: 
	Map<Integer, String> employeeById = new Map<Integer, String>();
    
    public Fall21MapExample(){
        //Adding a value in MAP.
        employeeById.put(10012, 'Anvar');
        employeeById.put(10456, 'Alp Aslam');
        employeeById.put(10312, 'Ayjemal');
        employeeById.put(10332, 'Anna');
        employeeById.put(10313, 'Ayjemal');
        employeeById.put(10332, 'Aysoltan');
        
        System.debug('employeeById: ' + employeeById);
        
        //Get a Value from MAP.
        String name = employeeById.get(10312);
        System.debug('name at 10312: ' + name);
        
        //LOOPs
        //Syntax of loop.
        /*
for(Datatype variableName : MapName/ListName/SetName){

}
*/
        //GETTING KEYS FROM MAP
        for(Integer employeeId :employeeById.keySet()){
            //.keySet() --> it will gives you SET of all Keys.
            //System.debug('employeeId: ' + employeeId);
        }
        
        //GETTING VALUES FROM MAP
        for(String employeeName :employeeById.values()){
            //.values() --> it will gives you LIST of all Values.
            //System.debug('employeeName: ' + employeeName);
        }
        
        //IN REAL WORLD.
        for(Integer employeeId :employeeById.keySet()){
            System.debug('employeeId: ' + employeeId 
                         + '  ' + 'employeeName: ' + employeeById.get(employeeId));
            
        }
    }
}