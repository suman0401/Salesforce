public class F1 {
    @future
    public static void demo(){
        system.debug('Hii');
       // F2.demo();
       System.enqueueJob(new F2());
    }
}