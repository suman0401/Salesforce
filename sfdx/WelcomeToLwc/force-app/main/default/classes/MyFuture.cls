public class MyFuture {
    
    @future
    public static void countContacts(Set<id> setId)
    {
        List<Account> lstAccount = [select id , (select id from contacts ) from account where id in :setId ];
        for( Account acc : lstAccount )
        {
            List<Contact> lstCont = acc.contacts ;
           // acc.id=lstCont;
            //acc.Number_of_Contacts__c = lstCont.size();
            //Number_of_Contacts__c 
        }
        update lstAccount;
    }
}