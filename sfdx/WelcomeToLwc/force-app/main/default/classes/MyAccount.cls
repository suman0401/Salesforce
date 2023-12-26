public class MyAccount {

    public PageReference doupdate() {
        update act;
        return new PageReference('/apex/mysuccess');
    }
    
    public PageReference doupsert(){
    upsert act;
    return new PageReference('/apex/mysuccess');
    }

Account act;

  public MyAccount(){
     id i=apexpages.currentpage().getparameters().get('id');
     
    if(i==null){
  act=new Account();
}
    else{
     act=[select name from account where id=:i];
}
    
}


 public Account getMyaccount() {
    return act;
}
}