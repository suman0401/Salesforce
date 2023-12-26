trigger SFDCAccountTrigger on Account (after insert) {
    new SFDCTriggerHandler().run('Account'); 
}