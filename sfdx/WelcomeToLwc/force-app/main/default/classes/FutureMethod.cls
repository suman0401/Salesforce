Global class FutureMethod{
    @future(callout = true)
    Public static void doCallout(Map<String,String>header,String url,String data){
        Http http = new Http();
        HTTPRequest req= New HTTPRequest();
        if(header!=null)
            for(String Key:header.keySet())
            req.setHeader(key,header.get(key));
        
        req.setBody(data);
        req.setMethod('POST');
        req.setEndpoint(url);
        http.send(req);
    }
    
}