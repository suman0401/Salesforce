public class MyQueue implements Queueable {

    public  void execute (QueueableContext qe){
        List<Account> acc=[select id,name,phone from Account where name='Process Builder Operation Success'];
        for(Account act:acc){
            act.BillingState='Updated From Queue';
          //  acc.add(act);
             system.debug(act);
        }
        update acc;
        system.debug(acc);
    }
}