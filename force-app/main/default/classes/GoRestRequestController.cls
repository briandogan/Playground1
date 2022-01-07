public class GoRestRequestController {

    public static GoRestGetUserResponse getAllUser() {
        
        // Instantiate a new http object
        Http h = new Http();
        
        // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://gorest.co.in/public/v1/users');
        req.setMethod('GET');
        
        // Send the request, and return a response
        HttpResponse res = h.send(req);
        //
        System.debug('Response' + res.getBody());
        //return res.getBody();
        
        GoRestGetUserResponse responseObj = GoRestGetUserResponse.parse(res.getBody());
        System.debug('Response' + responseObj.meta.pagination.total);
        return responseObj;
    }
    
    public static GoRestGetUserResponseSingle createUser(String email){
        String bodyStr = '{"name":"Tenali Ramakrishna", "gender":"male", "email":"'+ email +'", "status":"active"}';
        // Instantiate a new http object
        Http h = new Http();
        
        // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://gorest.co.in/public/v1/users');
        req.setMethod('POST');
        req.setBody(bodyStr);
        req.setHeader('Authorization', 'Bearer 7095301ae1da4d854037ae6587cf0eda623678b53e2dbaeef9ab62f5a27cc3bf');
        req.setHeader('Content-Type', 'application/json');
        
        // Send the request, and return a response
        HttpResponse res = h.send(req);
        //
        System.debug('Response' + res.getBody());
        //return res.getBody();
        
        GoRestGetUserResponseSingle responseObj = GoRestGetUserResponseSingle.parse(res.getBody());
        System.debug('Response' + responseObj.data);
        return responseObj;
    }
}