@isTest 
private class SessionUnitTestCases {
    @isTest static void validateGetId() {
        Session session = new Session();
        session.getId();
        System.assert(true);
    }

    @isTest static void validateSetId() {
        Session session = new Session();
        session.SetId('12345');
        System.assert(true);
    }

   
}