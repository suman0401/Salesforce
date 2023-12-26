trigger SFDCMerchandiseTrigger on Merchandise__c (after insert) {

    new SFDCTriggerHandler().run('Merchandise__c'); 
}