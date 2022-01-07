@isTest
global class AnimalLocatorMock implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animal": {"id": 1,"name": "chicken","eats": "chicken food","says": "cluck cluck"}}');
        response.setStatusCode(200);

        Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
        System.debug('Map Result ' + results);
        Map<String,Object> animalObj = (Map<String,Object>)results.get('animal');
        String animalName = (String)animalObj.get('name');
        System.debug('Name' + animalName);

        return response; 
    }
}