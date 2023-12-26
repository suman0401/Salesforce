public class SOSLDemo {
    
    public void searchtxt(){
        List<List<sObject>> searchtxt=[find 'tom' returning lead(id,name),contact(id,name)];
        List<Lead> muled=searchtxt[0];
        List<Contact> mcon=searchtxt[1];
        
        if(muled.size() > 0){
            for(Lead l:muled){
                System.debug(l);
            }
        }
        if(mcon.size() > 0){
            for(Contact c:mcon){
                System.debug(c);
            }
        }
        
    }

}