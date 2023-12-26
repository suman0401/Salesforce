public with sharing class CustomMetadataService {
    public CustomMetadataService() {

    }
    public static OTMM_CONFIGURATION__mdt getOTMMConfiguration(){
		try {
			OTMM_CONFIGURATION__mdt[] threatMappings = [SELECT OTMM_URL__c,OTMM_VERSION__c,
														OTMM_IMAGE_URL__c,SFDC_FILES_LIMIT__c,SFDC_FILE_SIZE_LIMIT_IN_BYTES__c 
														FROM OTMM_CONFIGURATION__mdt];

			for (OTMM_CONFIGURATION__mdt threatMapping : threatMappings){
				System.debug(threatMapping.OTMM_URL__c);
			}
			System.debug(threatMappings[0].OTMM_URL__c);
			System.debug(threatMappings);
			return threatMappings[0];
		}
		catch(Exception e) {
			throw new OTMMCustomException('Cannot fetch OTMM Config Values as they are not available',e);
		}
	} 
    public static OTMM_SFDC_METADATA_FIELD__mdt[] getOTMMMetadataFieldConfiguration(){

		try {
			OTMM_SFDC_METADATA_FIELD__mdt[] threatMappings = [SELECT OTMM_METADATA_FIELD_ID__c,SALESFORCE_FIELD_ID__c,
															  OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__c FROM OTMM_SFDC_METADATA_FIELD__mdt];
			/* for (OTMM_SFDC_METADATA_FIELD__mdt threatMapping : threatMappings){
				System.debug(threatMapping.OTMM_METADATA_FIELD_ID__c);
			} */
			//System.debug(threatMappings[0].OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__c);
			System.debug(threatMappings);
			return threatMappings;
		}
		catch(Exception e) {
			throw new OTMMCustomException('Cannot fetch  OTMM metadata Field Values as they are not available',e);
		}
	} 
    public static OTMM_SFDC_METADATA_FIELD__mdt[] getSpecifiedOTMMMetadataFieldConfiguration(String id){
		try {
			String query = 'SELECT OTMM_METADATA_FIELD_ID__c,SALESFORCE_FIELD_ID__c,OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__c FROM OTMM_SFDC_METADATA_FIELD__mdt WHERE OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__c = :id';
			OTMM_SFDC_METADATA_FIELD__mdt[] threatMappings=Database.query(query);
			System.debug(threatMappings);
			return threatMappings;
		}
		catch(Exception e) {
			throw new OTMMCustomException('Cannot fetch  OTMM metadata Field Values as they are not available',e);
		}
	}
	public static OTMM_SFDC_METADATA_FIELD__mdt[] getOTMMMetadataFieldConfigurationBasedOnSalesforceField(String name){
		try {
			String query = 'SELECT OTMM_METADATA_FIELD_ID__c,SALESFORCE_FIELD_ID__c,OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__c FROM OTMM_SFDC_METADATA_FIELD__mdt WHERE  SALESFORCE_FIELD_ID__c = :name';
			OTMM_SFDC_METADATA_FIELD__mdt[] threatMappings=Database.query(query);
			System.debug(threatMappings);
			return threatMappings;
		}
		catch(Exception e) {
			throw new OTMMCustomException('Cannot fetch OTMM metadata Field Values as they are not available',e);
		}
	} 
	public static OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt[] getOTMMMetadataConfiguration(){
		try {
			OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt[] threatMappings = [SELECT label,OTMM_FOLDER_ID__c,OTMM_FOLDER_TYPE_ID__c,OTMM_MODEL_ID__c,OTMM_SECURITY_POLICIES__c,SFDC_OBJECT_NAME__c
			 												  FROM OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt];
			for (OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt threatMapping : threatMappings){
				System.debug(threatMapping.SFDC_OBJECT_NAME__c);
			}
			//System.debug(threatMappings[0].SFDC_OBJECT_NAME__c);
			System.debug(threatMappings);
			return threatMappings;
		}
		catch(Exception e) {
			throw new OTMMCustomException('Cannot fetch OTMM  metadata config Values as they are not available',e);
		}
	} 
    public  static OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt[] getOTMMMetadataConfigurationByModelId(String modelId) {
		try {
			String query = 'SELECT label,OTMM_FOLDER_ID__c,OTMM_FOLDER_TYPE_ID__c,OTMM_MODEL_ID__c,OTMM_SECURITY_POLICIES__c,SFDC_OBJECT_NAME__c FROM OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt WHERE OTMM_MODEL_ID__c = :modelId';
			OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt[] OTMMthreatMappings=Database.query(query);
			return OTMMthreatMappings;
		}
		catch(Exception e) {
			throw new OTMMCustomException('Cannot fetch OTMM metadata Field Values as they are not available',e);
		}
	}
    public  static OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt getOTMMMetadataConfigurationByObject(String objectName) {
		try {
            System.debug('objectName');
            System.debug(objectName);
			String query = 'SELECT label,OTMM_FOLDER_ID__c,OTMM_FOLDER_TYPE_ID__c,OTMM_MODEL_ID__c,OTMM_SECURITY_POLICIES__c,SFDC_OBJECT_NAME__c FROM OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt WHERE SFDC_OBJECT_NAME__c = :objectName';
			OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt OTMMthreatMappings=Database.query(query);
            System.debug(OTMMthreatMappings);
			return OTMMthreatMappings;
		}
		catch(Exception e) {
			throw new OTMMCustomException('Cannot fetch OTMM metadata Field Values as they are not available',e);
		}
	}
	public  static OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt getSpecificOTMMMetadataConfigurationByModelId(String modelId) {
		String query = 'SELECT label,OTMM_FOLDER_ID__c,OTMM_FOLDER_TYPE_ID__c,OTMM_MODEL_ID__c,OTMM_SECURITY_POLICIES__c,SFDC_OBJECT_NAME__c FROM OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt WHERE OTMM_MODEL_ID__c = :modelId';
		OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt OTMMthreatMappings=Database.query(query);
		return OTMMthreatMappings;
	}
}
/* public with sharing class CustomMetadataService {
    public CustomMetadataService() {

    }
    public static OTMM_CUSTOM_METADATA__mdt getOTMMConfiguration(){
		try {
			OTMM_CUSTOM_METADATA__mdt[] threatMappings = [SELECT OTMM_URL__c,OTMM_BASIC_FOLDER_ID__c,OTMM_VERSION__c,OTMM_FOLDER_ID__c,OTMM_ACCOUNT_FOLDER_ID__c,
														OTMM_OPPORTUNITY_FOLDER_ID__c,OTMM_LEAD_FOLDER_ID__c,OTMM_SECURITY_POLICY_ID__c,
														OTMM_BASIC_CONTAINER_TYPE_ID__c,OTMM_PARENT_FOLDER_ID__c,OTMM_ROOT_FOLDER_ID__c,
														FILES_LIMIT__c,FILE_SIZE_LIMIT_IN_BYTES__c,OTMM_USER_NAME__c,OTMM_PASSWORD__c,
														OTMM_IMAGE_URL__c FROM OTMM_CUSTOM_METADATA__mdt];
			for (OTMM_CUSTOM_METADATA__mdt threatMapping : threatMappings){
				System.debug(threatMapping.OTMM_URL__c);
			}
			System.debug(threatMappings[0].OTMM_URL__c);
			System.debug(threatMappings);
			return threatMappings[0];
		}
		catch(Exception e) {
			throw new OTMMCustomException('Cannot fetch OTMM Custom metadata Values as they are not available',e);
		}
	} 

	public static OTMM_METADATA_CONFIG__mdt[] getOTMMMetadataConfiguration(){
		try {
			OTMM_METADATA_CONFIG__mdt[] threatMappings = [SELECT label,FOLDER_ID__c,OTMM_MODEL_ID__c,SALESFORCE_OBJECT_NAME__c,SECURITY_POLICIES__c
														FROM OTMM_METADATA_CONFIG__mdt];
			for (OTMM_METADATA_CONFIG__mdt threatMapping : threatMappings){
				System.debug(threatMapping.SALESFORCE_OBJECT_NAME__c);
			}
			System.debug(threatMappings[0].SALESFORCE_OBJECT_NAME__c);
			System.debug(threatMappings);
			return threatMappings;
		}
		catch(Exception e) {
			throw new OTMMCustomException('Cannot fetch OTMM  metadata config Values as they are not available',e);
		}
	} 
    public static OTMM_METADATA_FIELD__mdt[] getOTMMMetadataFieldConfiguration(){

		try {
			OTMM_METADATA_FIELD__mdt[] threatMappings = [SELECT OTMM_METADATA_FIELD_ID__c,SALESFORCE_FIELD_ID__c,OTMM_METADATA_CONFIG_MAPPING__c
														FROM OTMM_METADATA_FIELD__mdt];
			for (OTMM_METADATA_FIELD__mdt threatMapping : threatMappings){
				System.debug(threatMapping.OTMM_METADATA_FIELD_ID__c);
			}
			System.debug(threatMappings[0].OTMM_METADATA_CONFIG_MAPPING__c);
			System.debug(threatMappings);
			return threatMappings;
		}
		catch(Exception e) {
			throw new OTMMCustomException('Cannot fetch  OTMM metadata Field Values as they are not available',e);
		}
	} 
    public static OTMM_METADATA_FIELD__mdt[] getSpecifiedOTMMMetadataFieldConfiguration(String id){
		try {
			String query = 'SELECT OTMM_METADATA_FIELD_ID__c,SALESFORCE_FIELD_ID__c,OTMM_METADATA_CONFIG_MAPPING__c FROM OTMM_METADATA_FIELD__mdt WHERE  OTMM_METADATA_CONFIG_MAPPING__c = :id';
			OTMM_METADATA_FIELD__mdt[] threatMappings=Database.query(query);
			System.debug(threatMappings);
			return threatMappings;
		}
		catch(Exception e) {
			throw new OTMMCustomException('Cannot fetch  OTMM metadata Field Values as they are not available',e);
		}
	} 

	public static OTMM_METADATA_FIELD__mdt[] getOTMMMetadataFieldConfigurationBasedOnSalesforceField(String name){
		try {
			String query = 'SELECT OTMM_METADATA_FIELD_ID__c,SALESFORCE_FIELD_ID__c,OTMM_METADATA_CONFIG_MAPPING__c FROM OTMM_METADATA_FIELD__mdt WHERE  SALESFORCE_FIELD_ID__c = :name';
			OTMM_METADATA_FIELD__mdt[] threatMappings=Database.query(query);
			System.debug(threatMappings);
			return threatMappings;
		}
		catch(Exception e) {
			throw new OTMMCustomException('Cannot fetch OTMM metadata Field Values as they are not available',e);
		}
	} 
    public  static OTMM_METADATA_CONFIG__mdt[] getOTMMMetadataConfigurationByModelId(String modelId) {
		try {
			String query = 'SELECT label,FOLDER_TYPE_ID__c,FOLDER_ID__c,OTMM_MODEL_ID__c,SALESFORCE_OBJECT_NAME__c,SECURITY_POLICIES__c FROM OTMM_METADATA_CONFIG__mdt WHERE OTMM_MODEL_ID__c = :modelId';
			OTMM_METADATA_CONFIG__mdt[] OTMMthreatMappings=Database.query(query);
			return OTMMthreatMappings;
		}
		catch(Exception e) {
			throw new OTMMCustomException('Cannot fetch OTMM metadata Field Values as they are not available',e);
		}
	}
	public  static OTMM_METADATA_CONFIG__mdt getSpecificOTMMMetadataConfigurationByModelId(String modelId) {
		String query = 'SELECT label,FOLDER_TYPE_ID__c,FOLDER_ID__c,OTMM_MODEL_ID__c,SALESFORCE_OBJECT_NAME__c,SECURITY_POLICIES__c FROM OTMM_METADATA_CONFIG__mdt WHERE OTMM_MODEL_ID__c = :modelId';
		OTMM_METADATA_CONFIG__mdt OTMMthreatMappings=Database.query(query);
		return OTMMthreatMappings;
	}
}
 */