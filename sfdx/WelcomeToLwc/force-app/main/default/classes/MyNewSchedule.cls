public class MyNewSchedule {
    
     public static void demo(){
        MySchedule mb=new MySchedule();
        string sch='0 0 11/12 * 7 ?';
        system.schedule('New Schedule', sch, mb);
     
    }

}