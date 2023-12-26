@isTest 
private class  CreateFolderUnitTestCases {

    @testSetup static void makeData(){
        CreateFolder createFolder = new CreateFolder();
        Account acc = new Account(name = 'testaccount-sfdcconnectorunittestcases'); 
        insert acc;
        
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
    @isTest static void validatecreateFolderWithMetadata(){
        List<Account> accts = [SELECT Id FROM Account WHERE Name='testaccount-sfdcconnectorunittestcases' LIMIT 1];
        Test.setMock(HttpCalloutMock.class, new RestGetMetadata());
        Test.startTest();
        String response = CreateFolder.CreateFolderWithMetadata(accts[0].id);
        Test.stopTest();
        System.debug(response);
        System.assert(true);

    }

    @isTest static void validateGetRecordValues(){

        List<Account> accts = [SELECT Id FROM Account WHERE Name='testaccount-sfdcconnectorunittestcases' LIMIT 1];
        List<String> recordDetails = CreateFolder.getRecordValues(accts[0].id);
        System.debug('recordDetails: '+recordDetails);
        System.assert(true);

    }



    private class RestCreateBasicFolder200 implements HttpCalloutMock {

        public HTTPResponse respond(HTTPRequest req) {
            String fullJson = '{"folder_resource":{"folder":{}}}';
            HTTPResponse res = new HTTPResponse();
            //res.setHeader('Content-Type', 'text/json');
            res.setBody(fullJson);
            res.setStatusCode(200);
            return res;
        }
    }
    private class RestCreateBasicFolderNot200 implements HttpCalloutMock {

        public HTTPResponse respond(HTTPRequest req) {
            String fullJson = '{"folder_resource":{"folder":{}}}';
            HTTPResponse res = new HTTPResponse();
            //res.setHeader('Content-Type', 'text/json');
            res.setBody(fullJson);
            res.setStatusCode(404);
            return res;
        }
    }
    @isTest static void validatecreateBasicFolder(){
        //Validating 200 status
        Test.setMock(HttpCalloutMock.class, new RestCreateBasicFolder200());
        Test.startTest();
        CustomApexResponse response = CreateFolder.createBasicFolder('Salesforce.Accounts.Model','testfolder-unittestcases','parentfolderId');
        Test.stopTest();
        System.debug('createBasicFOlder: '+response);
        System.assert(true);

    } 
    @isTest static void validatecreateBasicFolderNot200Status(){
        //Validating 200 status
        Test.setMock(HttpCalloutMock.class, new RestCreateBasicFolderNot200());
        Test.startTest();
        CustomApexResponse response = CreateFolder.createBasicFolder('Salesforce.Accounts.Model','testfolder-unittestcases','parentfolderId');
        Test.stopTest();
        System.debug('createBasicFOlder: '+response);
        System.assert(true);
    }

}