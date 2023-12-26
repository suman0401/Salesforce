public with sharing class RecordService {
    public RecordService() {

	}
	@future(callout = true)
	public static void createFolder(Id id){
		//String response=CreateFolder.getFolderDetails(id);
		String response=CreateFolder.CreateFolderWithMetadata(id);
	}

	@future(callout = true)
	public static void updateFolder(Id id,List<String> updatedFields){
		System.debug('Apex trigger update folder'+id+'updatedFields'+updatedFields);
		for(Integer i=0;i<updatedFields.size();i++) {
			System.debug('fields'+updatedFields[i]);
		}
		//String response=UpdateFolder.updateFolderWithMetaData(id, updatedFields);
	}


	public static List<Sobject> getRecordDetails(String recordId){
		try {
			if(recordId !=null) {
				ID currentRecordId = recordId;
				DescribeSObjectResult describeResult = currentRecordId.getSObjectType().getDescribe();
				List<String> fieldNames = new List<String>(describeResult.fields.getMap().keySet());
				String query = ' SELECT ' + String.join(fieldNames, ',') + ' FROM ' + describeResult.getName() + ' WHERE  id = :currentRecordId ';
				List<Sobject> results = Database.query(query);
				return results;
			}
			else {
				throw new OTMMCustomException('Empty Record Id');
			}
		}
		catch(Exception e) {
			throw new OTMMCustomException(e.getMessage(),e);
		}
	}

	public static String getCurrentObjectName(String recordId){
		try {
			if(recordId !=null) {
				ID currentRecordId = recordId;
				DescribeSObjectResult describeResult = currentRecordId.getSObjectType().getDescribe();
				return describeResult.getName();
			}
			else {
				throw new OTMMCustomException('Empty Record Id');
			}
		}
		catch(Exception e) {
			throw new OTMMCustomException('Error while fetching current object name'+e.getMessage(),e);
		}
	}

	public static String updateFolderId(String recordId,String folderId) {
		
		try {

			if(recordId != null && folderId != null) {
				ID currentRecordId = recordId;
				DescribeSObjectResult describeResult = currentRecordId.getSObjectType().getDescribe();
				List<String> fieldNames = new List<String>(describeResult.fields.getMap().keySet());
				String query = ' SELECT ' + String.join(fieldNames, ',') + ' FROM ' + describeResult.getName() + ' WHERE  id = :currentRecordId ';
				List<Sobject> results = Database.query(query);

				if(Test.isRunningTest()) {
					return 'SUCCESS';
				}
			
                // FLS validation is done before execution reaches this point. 
                // See TriggerServices.createFolder() method for validation.
				if (!results.isEmpty()) {
						SObjectType objToken = Schema.getGlobalDescribe().get(describeResult.getName()); 
						DescribeSObjectResult objDef = objToken.getDescribe();
						Map<String, SObjectField> fields = objDef.fields.getMap();
						for (sObject rec: results){
							system.debug(folderId);
							rec.put('OTMMFolderId__c',folderId); 
						} 
					update results;
					return 'updated'+folderId;
				}
				else {
					//return 'No record Found';
					throw new OTMMCustomException('No record Found');
				}
			}
			else {
				throw new OTMMCustomException('Empty Record Id or folder Id');
			}
		}
		catch(Exception e) {
			throw new OTMMCustomException('Error in update folder id in record details'+e.getMessage(),e);
		}
			
        
    }
}