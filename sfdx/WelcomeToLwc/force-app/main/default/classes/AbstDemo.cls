public abstract class AbstDemo {
  //This is from VF
    public AbstDemo(){
        System.debug('From the parent');
    }
    public AbstDemo(integer a){
        System.debug('From the parent with different arg');
    }
    public abstract void getsalary();
    
    public void employee(){
        
    }

}