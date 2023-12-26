public class MyCustomSettingDemo {
    
    public void getdata(){
        MyCustom__c mcs= MyCustom__c.getInstance('Dataset');
        mymetadata__mdt md=mymetadata__mdt.getInstance('dataset');
        system.debug('Value of MyCustom__c Name ='+mcs.Name +'IsActive = '+mcs.IsActive__c);
        system.debug('Value of mymetadata__mdt  Name ='+md.label +'IsActive = '+mcs.IsActive__c);
        if(mcs.IsActive__c == true){
            system.debug('Call the trigger');
        }else{
            system.debug('Please donot call the trigger');
        }
    }
    
}