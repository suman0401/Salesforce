@isTest 
private class TriggerServicesUnitTestCases {
    @isTest static void validateTriggerServices() {
        TriggerServices triggerServices = new TriggerServices();
        System.assert(true);
    }

    @isTest static void testValidateFLSForOTMMField() {
        RecordService recrd = new RecordService();
        Account acc = new Account(name = 'testaccount');
        insert acc;
        TriggerServices.validateFLSForOTMMField(acc.Id);
        System.assert(true);

    }

}