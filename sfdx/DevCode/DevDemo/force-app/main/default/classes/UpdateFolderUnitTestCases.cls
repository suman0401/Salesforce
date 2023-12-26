@isTest 
private class UpdateFolderUnitTestCases {

    private class RestMock implements HttpCalloutMock {

        public HTTPResponse respond(HTTPRequest req) {
            //String accountfullJson = '{"metadata_model_resource":{"metadata_model":{"id":"ACCOUNT","name":"Salesforce.Accounts.Model","metadata_element_list":[{"type":"com.artesia.metadata.MetadataCategory","id":"SALESFORCE.ACCOUNTS.GROUP","name":"Accounts Group","metadata_element_list":[{"type":"com.artesia.metadata.MetadataField","id":"SALESFORCE.ACCOUNTS.NAME","name":"Account Name","analytics":false,"column_name":"NAME","data_length":2000,"data_type":"CHAR","displayable":true,"domained":false,"edit_type":"SIMPLE","editable":true,"enabled":true,"facetable":false,"multilingual":false,"prompt":"Account Name","required":false,"scale":0,"searchable":true,"searchable_scope_id":"1","sortable":true,"table_name":"SALESFORCE_ACCOUNTS","trigger_field":false},{"type":"com.artesia.metadata.MetadataField","id":"SALESFORCE.ACCOUNTS.INDUSTRY","name":"Industry","analytics":false,"column_name":"INDUSTRY","data_length":2000,"data_type":"CHAR","displayable":true,"domained":false,"edit_type":"SIMPLE","editable":true,"enabled":true,"facetable":false,"multilingual":false,"prompt":"Industry","required":false,"scale":0,"searchable":true,"searchable_scope_id":"1","sortable":true,"table_name":"SALESFORCE_ACCOUNTS","trigger_field":false},{"type":"com.artesia.metadata.MetadataField","id":"SALESFORCE.ACCOUNTS.PHONE","name":"Phone","analytics":false,"column_name":"PHONE","data_length":2000,"data_type":"CHAR","displayable":true,"domained":false,"edit_type":"SIMPLE","editable":true,"enabled":true,"facetable":false,"multilingual":false,"prompt":"Phone","required":false,"scale":0,"searchable":true,"searchable_scope_id":"1","sortable":true,"table_name":"SALESFORCE_ACCOUNTS","trigger_field":false},{"type":"com.artesia.metadata.MetadataField","id":"SALESFORCE.ACCOUNTS.TYPE","name":"Type","analytics":false,"column_name":"TYPE","data_length":2000,"data_type":"CHAR","displayable":true,"domained":false,"edit_type":"SIMPLE","editable":true,"enabled":true,"facetable":false,"multilingual":false,"prompt":"Type","required":false,"scale":0,"searchable":true,"searchable_scope_id":"1","sortable":true,"table_name":"SALESFORCE_ACCOUNTS","trigger_field":false},{"type":"com.artesia.metadata.MetadataField","id":"SALESFORCE.ACCOUNTS.WEBSITE","name":"Website","analytics":false,"column_name":"WEBSITE","data_length":2000,"data_type":"CHAR","displayable":true,"domained":false,"edit_type":"SIMPLE","editable":true,"enabled":true,"facetable":false,"multilingual":false,"prompt":"Website","required":false,"scale":0,"searchable":true,"searchable_scope_id":"1","sortable":true,"table_name":"SALESFORCE_ACCOUNTS","trigger_field":false},{"type":"com.artesia.metadata.MetadataField","id":"SALESFORCE.ACCOUNTS.OWNERSHIP","name":"Ownership","analytics":false,"column_name":"OWNERSHIP","data_length":2000,"data_type":"CHAR","displayable":true,"domained":false,"edit_type":"SIMPLE","editable":true,"enabled":true,"facetable":false,"multilingual":false,"prompt":"Ownership","required":false,"scale":0,"searchable":true,"searchable_scope_id":"1","sortable":true,"table_name":"SALESFORCE_ACCOUNTS","trigger_field":false}],"legacy_id":200015}],"has_multilingual_fields":false,"legacy_id":110,"object_type":"FOLDER"}}}';
            String fullJson = '{"metadata_model_resource":{"metadata_model":{"id":"OPPORTUNITY","name":"Salesforce.Opportunities.Model","metadata_element_list":[{"type":"com.artesia.metadata.MetadataCategory","id":"SALESFORCE.OPPORTUNITY.GROUP","name":"Opportunity Group","metadata_element_list":[{"type":"com.artesia.metadata.MetadataField","id":"SALESFORCE.OPPORTUNITIES.NAME","name":"Opportunity Name","analytics":false,"column_name":"NAME","data_length":2000,"data_type":"CHAR","displayable":true,"domained":false,"edit_type":"SIMPLE","editable":true,"enabled":true,"facetable":false,"multilingual":false,"prompt":"Opportunity Name","required":false,"scale":0,"searchable":true,"searchable_scope_id":"1","sortable":true,"table_name":"SALESFORCE_OPPORTUNITY","trigger_field":false},{"type":"com.artesia.metadata.MetadataField","id":"SALESFORCE.OPPORTUNITIES.STAGENAME","name":"Stage","analytics":false,"column_name":"STAGE_NAME","data_length":2000,"data_type":"CHAR","displayable":true,"domained":false,"edit_type":"SIMPLE","editable":true,"enabled":true,"facetable":false,"multilingual":false,"prompt":"Stage","required":false,"scale":0,"searchable":true,"searchable_scope_id":"1","sortable":true,"table_name":"SALESFORCE_OPPORTUNITY","trigger_field":false},{"type":"com.artesia.metadata.MetadataField","id":"SALESFORCE.OPPORTUNITIES.CONTRACTID","name":"Contract","analytics":false,"column_name":"CONTRACT_ID","data_length":2000,"data_type":"CHAR","displayable":true,"domained":false,"edit_type":"SIMPLE","editable":true,"enabled":true,"facetable":false,"multilingual":false,"prompt":"Contract","required":false,"scale":0,"searchable":true,"searchable_scope_id":"1","sortable":true,"table_name":"SALESFORCE_OPPORTUNITY","trigger_field":false},{"type":"com.artesia.metadata.MetadataField","id":"SALESFORCE.OPPORTUNITIES.CREATEDBYID","name":"Created By","analytics":false,"column_name":"CREATED_BY_ID","data_length":2000,"data_type":"CHAR","displayable":true,"domained":false,"edit_type":"SIMPLE","editable":true,"enabled":true,"facetable":false,"multilingual":false,"prompt":"Created By","required":false,"scale":0,"searchable":true,"searchable_scope_id":"1","sortable":true,"table_name":"SALESFORCE_OPPORTUNITY","trigger_field":false},{"type":"com.artesia.metadata.MetadataField","id":"SALESFORCE.OPPORTUNITIES.LASTMODIFIEDBYID","name":"Last Modified By","analytics":false,"column_name":"LAST_MODIFIED_BY_ID","data_length":2000,"data_type":"CHAR","displayable":true,"domained":false,"edit_type":"SIMPLE","editable":true,"enabled":true,"facetable":false,"multilingual":false,"prompt":"Last Modified By","required":false,"scale":0,"searchable":true,"searchable_scope_id":"1","sortable":true,"table_name":"SALESFORCE_OPPORTUNITY","trigger_field":false},{"type":"com.artesia.metadata.MetadataField","id":"SALESFORCE.OPPORTUNITIES.OWNERID","name":"Opportunity Owner","analytics":false,"column_name":"OWNER_ID","data_length":2000,"data_type":"CHAR","displayable":true,"domained":false,"edit_type":"SIMPLE","editable":true,"enabled":true,"facetable":false,"multilingual":false,"prompt":"Opportunity Owner","required":false,"scale":0,"searchable":true,"searchable_scope_id":"1","sortable":true,"table_name":"SALESFORCE_OPPORTUNITY","trigger_field":false},{"type":"com.artesia.metadata.MetadataField","id":"SALESFORCE.OPPORTUNITIES.PRICEBOOK2ID","name":"Price Book","analytics":false,"column_name":"PRICE_BOOK2_ID","data_length":2000,"data_type":"CHAR","displayable":true,"domained":false,"edit_type":"SIMPLE","editable":true,"enabled":true,"facetable":false,"multilingual":false,"prompt":"Price Book","required":false,"scale":0,"searchable":true,"searchable_scope_id":"1","sortable":true,"table_name":"SALESFORCE_OPPORTUNITY","trigger_field":false},{"type":"com.artesia.metadata.MetadataField","id":"SALESFORCE.OPPORTUNITIES.CLOSEDATE","name":"Close Date","analytics":false,"column_name":"CLOSE_DATE","data_length":20,"data_type":"DATE","displayable":true,"domained":false,"edit_type":"DATE","editable":true,"enabled":true,"facetable":false,"multilingual":false,"prompt":"Close Date","required":false,"scale":0,"searchable":true,"searchable_scope_id":"1","sortable":true,"table_name":"SALESFORCE_OPPORTUNITY","trigger_field":false}],"legacy_id":200016}],"has_multilingual_fields":false,"legacy_id":111,"object_type":"FOLDER"}}}';
            HTTPResponse res = new HTTPResponse();
            //res.setHeader('Content-Type', 'text/json');
            res.setBody(fullJson);
            res.setStatusCode(200);
            return res;
        }
    }
    

    @isTest static void validateUpdateFolderwithMetadata() {
        Account opp = new Account(name = 'testopportunity-unittestcases');
        //opp.OTMMFolderId__c = '33333333333adfasdfasf3w';
        insert opp;
       
        Test.setMock(HttpCalloutMock.class, new RestMock());
        Test.startTest();
        //SObject someRecord = [SELECT Id FROM Account LIMIT 1];
        List<String> updatedFields = new List<String> {'name'};
        UpdateFolder.updateFolderWithMetaData(opp.id,updatedFields);
        
        Test.StopTest();
        UpdateFolder updateFolder = new UpdateFolder();
        System.assert(true);
    }
    
    /*
     @isTest static void validateUpdateFolderwithMetadata() {
        Opportunity opp = new Opportunity(name = 'testopportunity-unittestcases');
        opp.CloseDate=date.today();
        opp.StageName='IsWon';
        //opp.sf_otmm_conn__OTMMFolderId__c = '33333333333adfasdfasf3w';
        insert opp;
       
        Test.setMock(HttpCalloutMock.class, new RestMock());
        Test.startTest();
        //SObject someRecord = [SELECT Id FROM Account LIMIT 1];
        List<String> updatedFields = new List<String> {'name','closedate','lastmodifieddate','systemmodstamp'};
        UpdateFolder.updateFolderWithMetaData(opp.id,updatedFields);
        
        Test.StopTest();
        UpdateFolder updateFolder = new UpdateFolder();
    }*/

  /*   @isTest static void validateUpdateFolderwithMetadataForLead() {
        Lead lead = new Lead(FirstName = 'testlead');
        lead.lastName = 'Testing last name';
        lead.OTMMFolderId__c = '33333333333adfasdfasf3w';
        insert lead;
       
        Test.setMock(HttpCalloutMock.class, new RestMock());
        Test.startTest();
        List<String> updatedFields = new List<String> {'FirstName','lastname'};
        UpdateFolder.updateFolderWithMetaData(lead.id,updatedFields);
        
        Test.StopTest();
        UpdateFolder updateFolder = new UpdateFolder();
    }
 */

    @isTest static void validateUpdateFolder() {

        string folderJson ='{"edited_folder":{"data":{"metadata":[{"value":{"value":{"value":"UpdateA1","type":"string"}},"type":"com.artesia.metadata.MetadataField","id":"SALESFORCE.ACCOUNTS.NAME"},{"value":{"value":{"value":"UpdateA1","type":"string"}},"type":"com.artesia.metadata.MetadataField","id":"ARTESIA.FIELD.ASSET NAME"}]}}}';
        string folderId = '44eb92c92bab2afce5f616d7f99ebf348653acaa';
        Test.setMock(HttpCalloutMock.class, new RestMock());
        Test.startTest();
        UpdateFolder.updateFolder(folderJson,folderId);
        Test.StopTest();
        UpdateFolder updateFolder = new UpdateFolder();
        System.assert(true);

    }

    @isTest static void validateUnlockFolder() {

        string folderId = '44eb92c92bab2afce5f616d7f99ebf348653acaa';
        Test.setMock(HttpCalloutMock.class, new RestMock());
        Test.startTest();
        UpdateFolder.unlockFolder(folderId);
        Test.StopTest();
        UpdateFolder updateFolder = new UpdateFolder();
        System.assert(true);

    }

    @isTest static void validateLockFolder() {

        string folderId = '44eb92c92bab2afce5f616d7f99ebf348653acaa';
        Test.setMock(HttpCalloutMock.class, new RestMock());
        Test.startTest();
        UpdateFolder.lockFolder(folderId);
        Test.StopTest();
        UpdateFolder updateFolder = new UpdateFolder();
        System.assert(true);
    }

}