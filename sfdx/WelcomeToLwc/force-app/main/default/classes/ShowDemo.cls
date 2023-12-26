@RestResource(urlMapping='/showAccount/*') //Here (/*) is used the give the id path for delete
global class ShowDemo {
    @HttpGet
    global static List<Account> dodemo(){
        List<Account> act=[select id,name from Account];
        return act;
    }
    @httppost
    global static Account doinsert(string name,string phone){
        Account act=new Account();
        act.name=name;
        act.phone=phone;
        insert act;
        // return act.id; // it will give the 18 digit id of the record
        return act;
    }
    
    //By passing id it will delete the particular account record
    @httpDelete
    global static string dodelete(){
        RestResponse res=RestContext.response;
        RestRequest req=RestContext.request;
        //The reason we are giving the string accountid is we dont need to hardcode the record id
        //in our code instead it will take the id from the workbench 
        string accountid=req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account act=[select id from Account where id=:accountid];
        delete act;
        return 'Success';
    }
    
    @httpput // For put you should add the account id in the json body if you want to update
    global static Account AccountUpdate(string name,string phone,string accountid){
        RestRequest req=RestContext.request;
        Account act=new Account();
        act.name=name;
        act.phone=phone;
        act.id=accountid;
        upsert act;
        return act;
    }

//This is json format to update the record if you dont give id it will create a new record    
    /*{
"name":"CreatedByAPI-01",
"phone":"123456789",
"accountid":"0015j00000dwqmj"
}*/

}