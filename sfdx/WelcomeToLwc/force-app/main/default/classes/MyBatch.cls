public class MyBatch implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc){
        string query ='select id,name from account';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc,List<Account> acc){
        for(Account act:acc){
            act.name=act.name+'Updated!!!';
        }
        update acc;
    }
    public void finish(Database.BatchableContext bc){
        MyBatchMerch mc=new MyBatchMerch();
        database.executeBatch(mc);
    }

}