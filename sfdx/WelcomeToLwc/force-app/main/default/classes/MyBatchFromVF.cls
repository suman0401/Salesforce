public  class MyBatchFromVF {
    
    public MyBatchFromVF() {
     
   
      }

    public void CallBatch() {
    MyBatch mb=new MyBatch();
     database.executeBatch(mb);
    }

}