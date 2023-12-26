public class Demo {
    
    public static final integer a = 10; 
        
    public void sayhello(){
        system.debug('Hello Apex..');
    }
     public void sayBye(){
         system.debug(system.label.Insert);//This is for using custom label name
        system.debug('Bye Apex..');
    }
    @testvisible
    private integer dosum(integer a,integer b){
    integer res=a+b;
    system.debug('Result is = '+res);
    return res;
    }
    
    public void updateAccount(Account act){
    // Do have code
    }


}