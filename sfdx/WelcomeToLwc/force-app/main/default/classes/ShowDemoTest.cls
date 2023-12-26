@isTest
public class ShowDemoTest {
    @testsetup
    private static void dotest(){
        Account acc=new Account(Name='Testing');
        insert acc;
    }
    
    private static void repeat(string url,string methodname){
        RestRequest req=new RestRequest();
        RestResponse res=new RestResponse();
        RestContext.request=req;
        RestContext.response=res;
        req.requestURI=url;
        req.httpMethod=methodname;
    }
    
    private static testmethod  void getaccount(){
       
        Account acc=[select id,name from account limit 1];
        ShowDemoTest.repeat('/services/apexrest/showAccount'+acc.Id,'Get');
                            
       // req.requestURI='/services/apexrest/showAccount'+acc.Id;
       // req.httpMethod='Get';
        
        List<Account> accData=ShowDemo.dodemo();
        system.assertEquals(accData[0].name, 'Testing');
    }
    private static testmethod void postaccount(){
        ShowDemoTest.repeat('services/apexrest/showAccount','POST');
        Account accid=ShowDemo.doinsert('Test','999999999');
        Account acc=[select id,name,phone from Account where id=:accid.Id limit 1];
        system.assertEquals(acc.Name, 'Test');
        system.assertEquals(acc.Phone, '999999999');
        
    }
    
    private static testmethod void accountdelete(){
        Account acc=[select id,name from Account limit 1];
        ShowDemoTest.repeat('/services/apexrest/showAccount/'+acc.Id,'DELETE');
        string accid=ShowDemo.dodelete();
        system.assertEquals([SELECT COUNT() FROM Account],0);
    }
    private static testmethod void accountput(){
        Account accid=ShowDemo.AccountUpdate('Test', '999999999','0015j00000dwqmj');
        Account acc=[SELECT ID,name,phone from ACCOUNT where id=:accid.Id limit 1];
        ShowDemoTest.repeat('/services/apexrest/showAccount','PUT');
        System.assertEquals(acc.Name, 'Test');
        system.assertEquals(acc.Phone, '999999999');
        System.assertEquals(acc.Id, '0015j00000dwqmj');
    }
}