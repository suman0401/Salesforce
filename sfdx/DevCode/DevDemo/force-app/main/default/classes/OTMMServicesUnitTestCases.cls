@isTest 
private class  OTMMServicesUnitTestCases {
    
    private class RestGetMetadata implements HttpCalloutMock {

        public HTTPResponse respond(HTTPRequest req) {
            //String fullJson = '{"metadata_model_resource":{"metadata_model":{"id":"ACCOUNT","name":"Salesforce.Accounts.Model","metadata_element_list":[{"type":"com.artesia.metadata.MetadataCategory","id":"SALESFORCE.ACCOUNTS.GROUP","name":"Accounts Group","metadata_element_list":[{"type":"com.artesia.metadata.MetadataField","id":"SALESFORCE.ACCOUNTS.NAME","name":"Account Name","analytics":false,"column_name":"NAME","data_length":2000,"data_type":"CHAR","displayable":true,"domained":false,"edit_type":"SIMPLE","editable":true,"enabled":true,"facetable":false,"multilingual":false,"prompt":"Account Name","required":false,"scale":0,"searchable":true,"searchable_scope_id":"1","sortable":true,"table_name":"SALESFORCE_ACCOUNTS","trigger_field":false}],"legacy_id":200015}],"has_multilingual_fields":false,"legacy_id":110,"object_type":"FOLDER"}}}';
            String fullJson = '{"metadata_model_resource":{"metadata_model":{"id":"ACCOUNT","name":"Salesforce.Accounts.Model","metadata_element_list":[{"type":"com.artesia.metadata.MetadataCategory","id":"SALESFORCE.ACCOUNTS.GROUP","name":"Accounts Group","metadata_element_list":[{"type":"com.artesia.metadata.MetadataField","id":"SALESFORCE.ACCOUNTS.NAME","name":"Account Name","analytics":false,"column_name":"NAME","data_length":2000,"data_type":"CHAR","displayable":true,"domained":false,"edit_type":"SIMPLE","editable":true,"enabled":true,"facetable":false,"multilingual":false,"prompt":"Account Name","required":false,"scale":0,"searchable":true,"searchable_scope_id":"1","sortable":true,"table_name":"SALESFORCE_ACCOUNTS","trigger_field":false},{"type":"com.artesia.metadata.MetadataField","id":"SALESFORCE.ACCOUNTS.INDUSTRY","name":"Industry","analytics":false,"column_name":"INDUSTRY","data_length":2000,"data_type":"CHAR","displayable":true,"domained":false,"edit_type":"SIMPLE","editable":true,"enabled":true,"facetable":false,"multilingual":false,"prompt":"Industry","required":false,"scale":0,"searchable":true,"searchable_scope_id":"1","sortable":true,"table_name":"SALESFORCE_ACCOUNTS","trigger_field":false},{"type":"com.artesia.metadata.MetadataField","id":"SALESFORCE.ACCOUNTS.PHONE","name":"Phone","analytics":false,"column_name":"PHONE","data_length":2000,"data_type":"CHAR","displayable":true,"domained":false,"edit_type":"SIMPLE","editable":true,"enabled":true,"facetable":false,"multilingual":false,"prompt":"Phone","required":false,"scale":0,"searchable":true,"searchable_scope_id":"1","sortable":true,"table_name":"SALESFORCE_ACCOUNTS","trigger_field":false},{"type":"com.artesia.metadata.MetadataField","id":"SALESFORCE.ACCOUNTS.TYPE","name":"Type","analytics":false,"column_name":"TYPE","data_length":2000,"data_type":"CHAR","displayable":true,"domained":false,"edit_type":"SIMPLE","editable":true,"enabled":true,"facetable":false,"multilingual":false,"prompt":"Type","required":false,"scale":0,"searchable":true,"searchable_scope_id":"1","sortable":true,"table_name":"SALESFORCE_ACCOUNTS","trigger_field":false},{"type":"com.artesia.metadata.MetadataField","id":"SALESFORCE.ACCOUNTS.WEBSITE","name":"Website","analytics":false,"column_name":"WEBSITE","data_length":2000,"data_type":"CHAR","displayable":true,"domained":false,"edit_type":"SIMPLE","editable":true,"enabled":true,"facetable":false,"multilingual":false,"prompt":"Website","required":false,"scale":0,"searchable":true,"searchable_scope_id":"1","sortable":true,"table_name":"SALESFORCE_ACCOUNTS","trigger_field":false},{"type":"com.artesia.metadata.MetadataField","id":"SALESFORCE.ACCOUNTS.OWNERSHIP","name":"Ownership","analytics":false,"column_name":"OWNERSHIP","data_length":2000,"data_type":"CHAR","displayable":true,"domained":false,"edit_type":"SIMPLE","editable":true,"enabled":true,"facetable":false,"multilingual":false,"prompt":"Ownership","required":false,"scale":0,"searchable":true,"searchable_scope_id":"1","sortable":true,"table_name":"SALESFORCE_ACCOUNTS","trigger_field":false}],"legacy_id":200015}],"has_multilingual_fields":false,"legacy_id":110,"object_type":"FOLDER"}}}';
            HTTPResponse res = new HTTPResponse();
            //res.setHeader('Content-Type', 'text/json');
            res.setBody(fullJson);
            res.setStatusCode(200);
            return res;
        }
    }
    /*@isTest static void validategetMetaData() {
        Map<String,String> headers = new Map<String,String>();

        Test.setMock(HttpCalloutMock.class, new RestGetMetadata());
        Test.startTest();
        OTMMServices.getMetaData(UtilServices.getOTMMUrl(OTMMEndpoints.metadatamodels)+'modelid',headers);
        Test.StopTest();

    }*/

    private class RestDownload implements HttpCalloutMock {

        public HTTPResponse respond(HTTPRequest req) {
            String fullJson = 'asset downloaded response - unit test cases';
            HTTPResponse res = new HTTPResponse();
            //res.setHeader('Content-Type', 'text/json');
            res.setBody(fullJson);
            res.setStatusCode(200);
            return res;
        }
    }
    @isTest static void validatedownloadAssetById() {
        Map<String,String> headers = new Map<String,String>();
        Test.setMock(HttpCalloutMock.class, new RestDownload());
        Test.startTest();
        OTMMServices.downloadAssetById('downloadurl',headers);
        System.assert(true);
    }


    private class RestDeleteAsset implements HttpCalloutMock {

        public HTTPResponse respond(HTTPRequest req) {
            String fullJson = 'delete asset reponse unit test cases';
            HTTPResponse res = new HTTPResponse();
            //res.setHeader('Content-Type', 'text/json');
            res.setBody(fullJson);
            res.setStatusCode(200);
            return res;
        }
    }
    @isTest static void validatedeleteAssetByIdd() {
        Map<String,String> headers = new Map<String,String>();

        Test.setMock(HttpCalloutMock.class, new RestDeleteAsset());
        Test.startTest();
        OTMMServices.deleteAssetById('deleteUrl',headers,'empty');
        Test.StopTest();
        System.assert(true);
    }


    private class RestUpdateFolder implements HttpCalloutMock {

        public HTTPResponse respond(HTTPRequest req) {
            String fullJson = 'update folder reponse unit test cases';
            HTTPResponse res = new HTTPResponse();
            //res.setHeader('Content-Type', 'text/json');
            res.setBody(fullJson);
            res.setStatusCode(200);
            return res;
        }
    }
    @isTest static void validateupdateFolder() {
        Map<String,String> headers = new Map<String,String>();

        Test.setMock(HttpCalloutMock.class, new RestUpdateFolder());
        Test.startTest();
        OTMMServices.updateFolder('updatefolderUrl',headers,'empty');
        Test.StopTest();
        System.assert(true);
    }
}