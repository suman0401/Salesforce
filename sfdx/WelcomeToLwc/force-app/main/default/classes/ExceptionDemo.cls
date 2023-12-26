public class ExceptionDemo {
    
    public void getDivide(integer a,integer b){
        try{
            Demo d;
            d.sayhello();
            integer res=a/b;
            System.debug('Result is = '+res);
        }catch(MathException me){
            System.debug('Please donot divide by zero....');
        }catch(NullPointerException ne){
            System.debug('Please donot call the method with the object that poiting to null');
        }catch(Exception me){
            System.debug('Server is busy');
        }
        finally{
            System.debug('Finally will execute with or without exception');
        }
    }

}