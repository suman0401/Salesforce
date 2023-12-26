@RestResource(urlmapping='/myacc/*')
global class DemoWeb {
    @httpget
    global static List<SObject> demo(){
        List<Account> act=[select id,name from account ];
        return act;
    }
    @httppost
    global static string insertAccount(string name,string phone,string website){
        Account act=new Account();
        act.name=name;
        act.phone=phone;
        act.website=website;
        insert act;
        return 'Success';
    }
    @httpdelete
    global static string updateAccount(){
        RestRequest req=RestContext.request;
        RestResponse res=RestContext.response;
       // string recid=req.params.get('id'); deleting via query parameter
       string recid=req.requestURI.substring(req.requestURI.lastIndexof('/')+1); //deleting via path paramether
        Account act=[select id from account where id=:recid];
        delete act;
        return 'Success';
    }
    
}