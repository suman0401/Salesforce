@RestResource(urlMapping='/showopp')
global class ShowDemo2 {
    @httpget
    global static List<Opportunity> opp(){
        List<Opportunity> opp=[select id,name from Opportunity];
        return opp; 
    }
    
    @httppost
    global static List<Opportunity> show(){
        RestRequest req=RestContext.request;
        Map<string,object> details=(Map<string,object>)Json.deserializeUntyped(req.requestBody.toString());
        List<object> oppdetails=(List<object>) details.get('details');
        List<Opportunity> listopp=new List<Opportunity>();
        for(Object o:oppdetails ) {
            Opportunity opp = new Opportunity();
            Map<String, Object> oppData = (Map<String, Object>) o;
            opp.Name = (String) oppData.get('name');
            opp.CloseDate = Date.valueOf(oppData.get('closeddate').toString());
            opp.StageName = (String) oppData.get('stageName');
            listopp.add(opp);
        }
        insert listopp;
        return listopp;
    }
}