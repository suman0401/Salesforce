public class ContactInsertArch {
    
  /*  public static void demo(List<Contact> con){
        List<Account> acc=new List<Account>();
        Account myacc=new Account();
        for(Contact mycon:con){
            Contact newcon=new Contact();
              newcon.AccountId;
                 
        }
         insert  myacc.CountOfContact__c ;   
    } */
    
 
   
    public static void demo(List<Contact> con){
        integer a= con.size();
        Account acc=new Account();
            acc = [SELECT id,CountOfContact__c FROM Account where id=:con[0].accountid];
            decimal b= acc.CountOfContact__c;
            acc.CountOfContact__c =a+b;
        update acc;
    }
    }