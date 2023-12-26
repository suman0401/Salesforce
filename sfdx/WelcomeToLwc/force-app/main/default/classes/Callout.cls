public class Callout {

     public static void getData() {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        if (res.getStatusCode() == 200) {
            Map<String, Object> data = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            List<Object> animals = (List<Object>) data.get('animals');
            for(Object animal: animals) {
                System.debug((String) animal);
            }
        }
    }
}