public class MyBatchMerch implements database.Batchable<sObject> {
    
     public Database.QueryLocator start(Database.BatchableContext bc){
        string query ='select id,name,Merchandise_Price__c from merchandise__c';
        return Database.getQueryLocator(query);
    }
    public void execute(database.BatchableContext bc,List<Merchandise__c> merchan){
        for(Merchandise__c mer:merchan){
            mer.Merchandise_Price__c=101;
        }
        update merchan;
        
    }
    public void finish(database.BatchableContext bc){
        
    }

}