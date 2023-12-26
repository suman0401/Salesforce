public class SOQLMerchandise {
    
    public void getmerchandise(){
        List<Merchandise__c> Llist=[select id,Merchandise_Desc__c,Merchandise_Price__c,Merchandise_Stock__c from Merchandise__c];
        for(Merchandise__c mc :Llist){
            system.debug('Id = ' +mc.id + ' desc = ' +mc.Merchandise_Desc__c  + ' price = ' +mc.Merchandise_Price__c
                        +' Stock = ' +mc.Merchandise_Stock__c);
        }
    }

}