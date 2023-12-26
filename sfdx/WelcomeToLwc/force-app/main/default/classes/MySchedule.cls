global class MySchedule implements Schedulable {
    
    global void execute(SchedulableContext sc){
        Mybatch mb=new MyBatch();
        database.executeBatch(mb);
    }

}