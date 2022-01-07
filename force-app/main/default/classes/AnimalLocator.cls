public with sharing class AnimalLocator {
    public AnimalLocator() {
    }

    public static String getAnimalNameById(integer id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        String animalName = '';
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            System.debug('Map Result ' + results);
          	Map<String,Object> animalObj = (Map<String,Object>)results.get('animal');
           	animalName = (String)animalObj.get('name');
            System.debug('Name' + animalName);
        }
        return animalName;
    }
}