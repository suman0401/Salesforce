@RestResource(urlMapping='/AccountId/*') //Here (/*) is used the give the id path
global class ShowDemoID {
    @httpget
    global static Account doget(){
        RestResponse res=RestContext.response;
        RestRequest req=RestContext.request;
        string accountid=req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account act=[select id,name from Account where id=:accountid];
        return act;   
    }
}