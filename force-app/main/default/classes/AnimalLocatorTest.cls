@isTest
private class AnimalLocatorTest {
    @isTest static  void testGetAnimalById() {
        
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 

        string response = AnimalLocator.getAnimalNameById(1);
        // Verify that the response received contains fake values
        String contentType = response.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String animalValue = response.getBody();
        System.debug(response.getBody());       
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, response.getStatusCode());

    }
}