@isTest 
private class RecordServicesUnitTestCases {
   /* @isTest static void validateupdateFolderId() {
        Account acc = new Account(name = 'testaccount');
        insert acc;

        RecordService.updateFolderId(acc.Id,'randomfolderid222');
        System.assert(true);
    }

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
    @isTest static void validatecreateFolder(){
        Account acc = new Account(name = 'testaccount');
        insert acc;
        Test.setMock(HttpCalloutMock.class, new RestGetMetadata());
        Test.startTest();
        RecordService.createFolder(acc.id);
        Test.stopTest();
        System.assert(true);

    }


    @isTest static void validateupdateFolder() {
        RecordService recrd = new RecordService();
        Account acc = new Account(name = 'testaccount');
        insert acc;
        RecordService.updateFolder(acc.Id,new List<String> {'name'});
        System.assert(true);
    }


    @isTest static void validateRecordServices() {
        RecordService recrd = new RecordService();
        System.assert(true);
    }

    @isTest static void validateGetRecordDetailsWithId() {
        RecordService recrd = new RecordService();
        Account acc = new Account(name = 'testaccount');
        insert acc;
        RecordService.getRecordDetails(acc.Id);
        System.assert(true);
    }


    @isTest static void validateGetCurrentObjectNameWithId() {
        RecordService recrd = new RecordService();
        Account acc = new Account(name = 'testaccount');
        insert acc;
        RecordService.getCurrentObjectName(acc.Id);
        System.assert(true);
    }/*

/*     @isTest static void validategetRecordDetailsError() {

        RecordService.getRecordDetails(null);
    } */
}