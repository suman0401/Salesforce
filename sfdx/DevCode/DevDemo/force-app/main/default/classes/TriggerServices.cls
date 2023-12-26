public with sharing class TriggerServices {
    public TriggerServices() {

    }
    @future(callout = true)
	public static void createFolder(Id id){
		
		//String response = CreateFolder.CreateFolderWithMetadata(id);
		try {
			if(!Test.isRunningTest()){
				validateFLSForOTMMField(id);
			}   
			String response = CreateFolder.CreateFolderWithMetadata(id);
		}
		catch(Exception e) {
			System.debug(e.getMessage());
			System.debug(e.getCause());
			System.debug(e.getLineNumber());
            throw new OTMMCustomException(e.getMessage(), e);
		}
	}

	@future(callout = true)
	public static void updateFolder(Id id,List<String> updatedFields){

		System.debug('Apex trigger update folder'+id+'updatedFields'+updatedFields);
		for(Integer i = 0;i < updatedFields.size();i++) {
			System.debug('fields'+updatedFields[i]);
		}
		String response = UpdateFolder.updateFolderWithMetaData(id, updatedFields);
	}
    
    // validate the FLS before making an update
    public static void validateFLSForOTMMField(Id objectId) {

		DescribeSObjectResult describeResult = objectId.getSObjectType().getDescribe();
		Map<String, SObjectField> fieldMaps = describeResult.fields.getMap();
		
		System.debug('Retrievd fields');
		for (String fieldName : fieldMaps.keySet()){
			System.debug('field name is ' + fieldName);
			if(fieldName.equals('otmmfolderid__c') || fieldName.equals('OTMMFolderId__c') || fieldName.equals('sf_otmm_conn__otmmfolderid__c') 
			 	|| fieldName.equals('sf_otmm_conn__OTMMFolderId__c')) {
				System.debug('Found OTMM FOlder ID field - ' + fieldName);
				
				SObjectField fieldObj = fieldMaps.get(fieldName);
				
				System.debug('Is Updateable - ' + fieldObj.getDescribe().isUpdateable());
				System.debug('Is Createable - ' + fieldObj.getDescribe().isCreateable());
				
                if(!fieldObj.getDescribe().isCreateable()) {
					throw new OTMMCustomException('User do not have rights to update the Folder ID field for ' + describeResult.getName() +'. Not creating OTMM Folder');
				}
                
				if(!fieldObj.getDescribe().isUpdateable()) {
					throw new OTMMCustomException('User do not have rights to update the Folder ID field for ' + describeResult.getName() +'. Not creating OTMM Folder');
				}
			}
		}
	}

	/* @future(callout = true)
	public static void createOTMMFolder(){
		//OTMMComponentController.createFolder();
	} */
}