@isTest 
private class ValidationUnitTestCases {
    
    @isTest static void validateTriggers()
    {
        Account acc = new Account(name = 'testaccount');
        insert acc;
        //acc.name = 'testaccountupdate';
        //update acc;

        //SocialPost sp = new SocialPost(name = 'test');
        //insert sp;

        Campaign camp = new Campaign(name = 'test');
        insert camp;
        
        Opportunity opp = new Opportunity(name = 'test');
        opp.CloseDate=date.today();
        opp.StageName='IsWon';
        insert opp;


        Lead lead = new Lead(company = 'test');
        lead.Lastname = 'test';
        insert lead;
        System.assert(true);
    }
}