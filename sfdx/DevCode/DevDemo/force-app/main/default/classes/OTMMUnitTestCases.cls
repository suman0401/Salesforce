@isTest
private class OTMMUnitTestCases {
    @isTest static void validateOTMM() {

        Session session = new Session();
        session.SetId('sessionid');
        session.getId();

        SessionResource sessionResource = new SessionResource();
        sessionResource.SetSession(session);
        sessionResource.getSession();

        OTMM otmm = new OTMM();
        otmm.SetSessionResource(sessionResource);
        otmm.getSessionResource();
        System.assert(true);

    }
}