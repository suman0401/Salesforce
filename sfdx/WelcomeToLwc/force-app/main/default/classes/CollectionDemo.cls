public class CollectionDemo {
    
    public void getNames(){
   //   List<string> nm=new List<string>();
        Set<string> nm=new Set<string>();
        nm.add('suman');
        nm.add('suresh');
      //nm.add(1,'priya');//proof for list use internally array data structure
        nm.add('priya');
        nm.add('John');
        nm.add('mathew');
        nm.add('suresh');
        system.debug('Names are = '+nm);
        system.debug('Size of the set is = '+nm.size());
        
        for(String n:nm){
            system.debug('Name = '+n);
        }
        
        Iterator<String> itr= nm.iterator();
        while(itr.hasNext()){
            System.debug(itr.next());
        }
    }
    
    public void getNamesByMap(){
        Map<string,string> names=new Map<string,string>();
        names.put('nm1', 'amit');
        names.put('nm2', 'suman');
        names.put('nm3', 'Raj');
        names.put('nm4', 'venkat');
        names.put('nm5', 'vimal');
        System.debug(names);
        
        System.debug(names.get('nm1'));
        
        Set<string>key=names.KeySet();
        for(string newkey:key){
            system.debug('Key is = '+newkey  +  'value is = ' +names.get(newkey));
        }
        
        System.debug('Values of all the keys '+names.values());
        
         Iterator<String> itr= key.iterator();
        while(itr.hasNext()){
            System.debug( names.get( itr.next()));
        
        }
   }
}