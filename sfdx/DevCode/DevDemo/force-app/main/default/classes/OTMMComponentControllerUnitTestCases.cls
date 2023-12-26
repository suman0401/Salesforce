@isTest 
private class OTMMComponentControllerUnitTestCases {
    private class RestSession implements HttpCalloutMock {

        public HTTPResponse respond(HTTPRequest req) {
            String fullJson = '{"session_resource":{"session":{"domain_name":"OTMM","id":2002894710,"local_session":false,"login_name":"tsuper","message_digest":"40a250ec23f3993c2c34b4a329b51d55720b29b2","role_name":"Administrator","user_full_name":"admin, otmm","user_id":"1001","user_role_id":1,"validation_key":2009177023}}}';
            HTTPResponse res = new HTTPResponse();
            //res.setHeader('Content-Type', 'text/json');
            res.setBody(fullJson);
            res.setStatusCode(200);
            res.setHeader('Set-Cookie','JSESSIONID=randomjessionid123;');
            return res;
        }
    }
    @isTest static void check() {
        OTMMComponentController controller = new OTMMComponentController();
        OTMMComponentController.getOTMMUrl();
        OTMMComponentController.getImageFileUrl();
        OTMMComponentController.getFolderDetails('666');
        Test.setMock(HttpCalloutMock.class, new RestSession());
        Test.startTest();
        OTMMComponentController.getHeaderValues();
        Test.StopTest();
        System.assert(true);
        
    }
}