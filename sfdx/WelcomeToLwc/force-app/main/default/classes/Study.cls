public class Study {
    static integer value=1;
    public static void method(){
        
        //Study a=new Study(); //If you want to call non static method create an object of the class and call the non static method
        //a.show();
        
        System.debug('Hii..');
        
        system.debug(value);//if you want to access the value integer make the integer static or make the method non-static
        //It will throw variable does not exist
        
        //show();//You can call like this if the show() method is also static
    }
    
    public  void show(){
        system.debug(value);
        System.debug('Hello');//In annonimious window if you want to call static method just write class name a dot(.) static method name   
       method();    
    }
    
    public void display(){
        show();
        system.debug('Hii');
        show();
    }
    public void demo(){
        value=value +1;
        system.debug(value);
    }
    public void showdemo(){
        
        system.debug(value);
    }
    
}