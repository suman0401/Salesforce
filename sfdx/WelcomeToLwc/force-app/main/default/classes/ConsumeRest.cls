public class ConsumeRest {
    
    //For Callout from salesforce to heroku
   /* public void demo(){
        Http http=new Http();
        HttpRequest req=new HttpRequest();
        //You need to define the end url in remote site settings
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        req.setMethod('POST');
        //if you are passing the body in get then the status code become 201
        //if you are not passing the body then the status code is 200
        //we need to set the body in JSON format
        req.setBody('{"name" : "Lion"}');
        req.setHeader('Content-Type', 'application/json');
        HttpResponse res=http.send(req);
        if(res.getStatusCode()!=201){
            system.debug('Error status code '+res.getStatusCode()+' '+res.getStatus());
        }
        else{
            system.debug(res.getBody());
            system.debug('Success');
        }
    }
*/
    //******************************************//
    //for Future method Asyn call
    @future(Callout=true)
     public static void show(){
        Http http=new Http();
        HttpRequest req=new HttpRequest();
        //You need to define the end url in remote site settings
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        req.setMethod('POST');
        //if you are passing the body in get then the status code become 201
        //if you are not passing the body then the status code is 200
        //we need to set the body in JSON format
        req.setBody('{"name" : "Lion"}');
        req.setHeader('Content-Type', 'application/json');
        HttpResponse res=http.send(req);
        if(res.getStatusCode()!=201){
            system.debug('Error status code '+res.getStatusCode()+' '+res.getStatus());
        }
        else{
            system.debug(res.getBody());
            system.debug('Success');
        }
    }
}