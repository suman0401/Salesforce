public class Assignment {
    
    public void getnames(){
        
        List<string> names=new List<string>();
        Set<string> newset=new Set<string>();
        names.add('Ragav');
        names.add('Bindhu');
        names.add('Raj');
        names.add('Ragav');
       // System.debug('Names with Duplicate '+names);
        for(string newword:names){
            //system.debug(newword);
        newset.add(newword);
            }
        system.debug(+names);
       
        
        Set<string> newnames=new Set<string>();
        newnames.addall(names);
        
        for(string newnames1:newnames)
            system.debug(newnames1);
        
    }
    
}