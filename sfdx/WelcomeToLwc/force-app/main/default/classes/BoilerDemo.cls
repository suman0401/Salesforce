public class BoilerDemo {
    integer temp;
    public void getDemo(){
        try{
            temp=0;
            for(temp=0;temp<100;temp++){
                System.debug('Value of Temp = '+temp);
                if(temp>50){
                    throw new BoilerException();
                }
            }
        }catch(BoilerException bx){
            temp=0;
            System.debug('Cool Boiler is reseted!!!....');
        }
    }
    
}