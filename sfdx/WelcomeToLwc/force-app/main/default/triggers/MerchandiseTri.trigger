trigger MerchandiseTri on Merchandise__c (before insert,after insert,before update,after update,before delete,after delete,after undelete) {

   if(Trigger.isDelete && Trigger.isbefore){
    //  MyMerchandiseInsert.merchaninsert(Trigger.old);
       MyMerchandiseInsert.merchaninsertBulk(Trigger.old);
   }

}