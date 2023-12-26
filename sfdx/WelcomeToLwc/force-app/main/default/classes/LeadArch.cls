public class LeadArch {
   
  // static string LastName;
    public static void demo(List<Lead> ld){
        List<Lead_Arch__c> ldarch=new List<Lead_Arch__c>();
        for(Lead myld:ld){
            Lead_Arch__c newld=new Lead_Arch__c();
            newld.Name=myld.LastName;
            ldarch.add(newld);  
        }
        if(ldarch.size() > 0){
            insert ldarch;
        } 
    }
}