@isTest
public class ShowDemo2_Test {
    @testsetup
    public static void dodemo(){
       // List<Opportunity> opplist=new List<Opportunity>();
        Opportunity opp1=new Opportunity();
        //Opportunity opp2=new Opportunity();
        opp1.Name='Name1';
        opp1.CloseDate=date.newInstance(2022, 03, 10);
        opp1.StageName='ClosedWon';
              // opplist.add(opp1);
       // opp2.Name='Name2';
       // opp1.StageName='Lost';
        //opp1.CloseDate=date.newInstance(2022, 03, 23);
        //opplist.add(opp2);
        insert opp1;
    }
    public static testmethod void dotest(){
        RestRequest req=new RestRequest();
        RestResponse res=new RestResponse();
        req.requestURI='/services/apexrest/showopp';
        req.httpMethod='POST';
        RestContext.request = req;
        RestContext.response= res;
        req.requestBody=blob.valueOf('{"details":[ {"name":"CreatedByAPI-001","closeddate":"2012-04-23","stage":"ClosedWon"},{"name":"CreatedByAPI-002", "closeddate":"2012-04-23","stage":"ClosedWon"} ]}');
        List<Opportunity> newopt=ShowDemo2.show();
        Opportunity opt=[select id,name,CloseDate,StageName from Opportunity where id=:newopt[0].id   limit 2];
        System.assertEquals(opt.Name,'CreatedByAPI-001');
       // System.assertEquals(newopt[1].Name, 'Name2');
        
    }
}