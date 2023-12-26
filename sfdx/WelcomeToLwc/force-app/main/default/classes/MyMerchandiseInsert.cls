public class MyMerchandiseInsert {
    //This is for single delete
    public static void merchaninsert(List<Merchandise__c> me){
        Merchandise_Arch__c merchan=new Merchandise_Arch__c();
        merchan.Name=me[0].name;
        merchan.Merchandise_Arch_Desc__c=me[0].Merchandise_Desc__c;
        merchan.Merchandise_Arch_Stock__c=me[0].Merchandise_Stock__c;
        merchan.Merchandise_Arch_Price__c=me[0].Merchandise_Price__c;
        insert merchan;
        
    }
    
    //This is for bulk delete using loop
    
    public static void merchaninsertBulk(List<Merchandise__c> me){
      List<Merchandise_Arch__c> Mlist =new  List<Merchandise_Arch__c>();
        for(Merchandise__c mer:me){
            Merchandise_Arch__c merchan=new Merchandise_Arch__c(); //
            merchan.Name=mer.name;
            merchan.Merchandise_Arch_Desc__c=mer.Merchandise_Desc__c;
            merchan.Merchandise_Arch_Stock__c=mer.Merchandise_Stock__c;
            merchan.Merchandise_Arch_Price__c=mer.Merchandise_Price__c;
            Mlist.add(merchan);
           
        }
        if(Mlist.size() >0)
           insert Mlist;
        
    }

}