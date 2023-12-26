@isTest
private class Demo_Test{

static Account act; 
@testsetup static void doinsert(){
 act=new Account();
 act.name='bsl';
 insert act;
}

  public static testmethod void doTest(){
     Demo d=new Demo();
     d.sayHello();
     d.sayBye();
     integer a=d.dosum(10,20);
     system.assertEquals(a,30);
     Account act=[select id,name from account where name='bsl'];
     d.updateAccount(act);
  }

}