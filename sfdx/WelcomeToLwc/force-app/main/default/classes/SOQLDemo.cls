public class SOQLDemo {
    
    public void getAccount(){
        List<Account> Llist=[select id,name from account];
        for(Account ac:Llist){
            system.debug('Account Id = '+ac.id +'Account Name = '+ac.Name);
        }
    }

}