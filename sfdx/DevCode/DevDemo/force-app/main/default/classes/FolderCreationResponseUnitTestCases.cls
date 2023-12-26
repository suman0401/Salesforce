@isTest
private class FolderCreationResponseUnitTestCases {
    @isTest static void validateFolderCreationResponse() {
        FolderCreationResponse metadata = new FolderCreationResponse();
        String samplefolderresponse = '{"folder_resource":{"folder":{"access_control_descriptor":{"permissions_map":{"entry":[{"key":"text.securityPolicy.permission.Custom04Permission","value":false},{"key":"text.securityPolicy.permission.ContentEditPermission","value":false},{"key":"text.securityPolicy.permission.AssetViewPermission","value":false},{"key":"text.securityPolicy.permission.ProjectViewPermission","value":false},{"key":"text.securityPolicy.permission.MembershipEditPermission","value":false},{"key":"text.securityPolicy.permission.Custom03Permission","value":false},{"key":"text.securityPolicy.permission.CommentsPermission","value":false},{"key":"text.securityPolicy.permission.MetaDataEditPermission","value":false},{"key":"text.securityPolicy.permission.EditParentsPermission","value":false},{"key":"text.securityPolicy.permission.Custom02Permission","value":false},{"key":"text.securityPolicy.permission.ExportPermission","value":false},{"key":"text.securityPolicy.permission.SummaryViewPermission","value":false},{"key":"text.securityPolicy.permission.PreviewViewPermission","value":false},{"key":"text.securityPolicy.permission.SubscribePermission","value":false},{"key":"text.securityPolicy.permission.DeleteAssetPermission","value":false},{"key":"text.securityPolicy.permission.Custom01Permission","value":false}]}},"asset_id":"f54eb064096e326480b7e6f13fa142dc07c3def7","asset_state":"NORMAL","asset_state_last_update_date":"2021-07-13T06:48:07.273-05:00","asset_state_user_id":"1006","checked_out":false,"content_editable":true,"content_state":"NORMAL","content_type":"NONE","creator_id":"1006","data_type":"CONTAINER","date_imported":"2021-07-13T06:48:07.273-05:00","date_last_updated":"2021-07-13T06:48:07.273-05:00","deleted":false,"expired":false,"import_job_id":0,"latest_version":true,"legacy_model_id":14,"locked":false,"metadata":{"id":"","metadata_element_list":[]},"metadata_model_id":"ARTESIA.MODEL.BASIC FOLDER","name":"test-folder","original_asset_id":"f54eb064096e326480b7e6f13fa142dc07c3def7","security_policy_list":[{"id":2,"status":"NORMAL"}],"version":0,"container_id":"f54eb064096e326480b7e6f13fa142dc07c3def7","container_type_id":"ARTESIA.BASIC.FOLDER","in_review":false}}}';
        FolderCreationResponse.parse(samplefolderresponse);
        
        FolderCreationResponse.Security_policy_list securityPolicyList = new FolderCreationResponse.Security_policy_list();
        securityPolicyList.id=0;
        securityPolicyList.status='status';
        List<FolderCreationResponse.Security_policy_list> securityPolicyLists = new List<FolderCreationResponse.Security_policy_list>();
        securityPolicyLists.add(securityPolicyList);
        
        FolderCreationResponse.Entry entry = new FolderCreationResponse.Entry();
        entry.key='key';
        entry.value=true;
        
        FolderCreationResponse.Permissions_map permissionsMap = new FolderCreationResponse.Permissions_map();
        List<FolderCreationResponse.Entry> entries = new List<FolderCreationResponse.Entry>();
        entries.add(entry);
        permissionsMap.entry=entries;
        
        FolderCreationResponse.Access_control_descriptor accessControlDescriptor = new FolderCreationResponse.Access_control_descriptor();
        accessControlDescriptor.permissions_map=permissionsMap;
            
        
        FolderCreationResponse.Metadata_element_list metadataElementList = new FolderCreationResponse.Metadata_element_list();
        FolderCreationResponse.Metadata metadataa = new FolderCreationResponse.Metadata();
        List<FolderCreationResponse.Metadata_element_list> metadataElementLists = new List<FolderCreationResponse.Metadata_element_list>();
        metadataElementLists.add(metadataElementList);
		metadataa.id='id';
        metadataa.metadata_element_list=metadataElementLists;
        
        FolderCreationResponse.Folder folder = new FolderCreationResponse.Folder();
        folder.access_control_descriptor=accessControlDescriptor;
        folder.asset_id='asset_di';
        folder.asset_state='state';
        folder.asset_state_last_update_date='';
        folder.asset_state_user_id='user';
        folder.checked_out=true;
        folder.container_id='id';
        folder.container_type_id='2';
        folder.content_editable=true;
        folder.content_state='state';
        folder.content_type='t';
        folder.creator_id='';
        folder.data_type='';
        folder.date_imported='';
        folder.deleted=false;
        folder.expired=false;
        folder.import_job_id=null;
        folder.in_review=false;
        folder.latest_version=true;
        folder.legacy_model_id=null;
        folder.locked=false;
        folder.metadata=metadataa;
        folder.metadata_model_id='';
        folder.name='';
        folder.original_asset_id='';
        folder.security_policy_list=securityPolicyLists;
        folder.version=null;
        
        System.assert(true);

    }
}