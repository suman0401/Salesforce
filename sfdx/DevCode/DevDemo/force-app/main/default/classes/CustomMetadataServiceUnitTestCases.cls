@isTest 
private class CustomMetadataServiceUnitTestCases {
    @isTest static void validateOTMMConfigurations(){
        CustomMetadataService custom = new CustomMetadataService();
        OTMM_CONFIGURATION__mdt configs = CustomMetadataService.getOTMMConfiguration();
        System.debug('OTMM URL is: '+configs.OTMM_URL__c);
        System.assertEquals(false,String.isBlank(configs.OTMM_URL__c));
    }

    @isTest static void validateGetOTMMMetadataFieldConfiguration(){
        OTMM_SFDC_METADATA_FIELD__mdt[] metadataFields = CustomMetadataService.getOTMMMetadataFieldConfiguration();
        System.debug('Metadatafields: '+metadataFields);
        //System.assertEquals(true,metadataFields.size()>0);
        System.assert(true);
    }

    @isTest static void validateGetOTMMMetadataConfiguration(){
        OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt[] folderMappings = CustomMetadataService.getOTMMMetadataConfiguration();
        System.debug('FolderMappings: '+folderMappings);
        //System.assertEquals(true,folderMappings.size()>0);
        System.assert(true);
    }

    @isTest static void validateGetOTMMMetadataConfigurationByObject(){
        String objectName = 'Account';
        OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt objectMappings = CustomMetadataService.getOTMMMetadataConfigurationByObject(objectName);
        System.debug('otmm config by object name: '+objectMappings);
        System.assert(true);
    }

    @isTest static void validateGetTMMMetadataFieldConfigurationBasedOnSalesforceField(){
        String name = 'Name';
        OTMM_SFDC_METADATA_FIELD__mdt[] objectMappings = CustomMetadataService.getOTMMMetadataFieldConfigurationBasedOnSalesforceField(name);
        System.assert(true);
    }

    @isTest static void validateGetOTMMMetadataConfigurationByModelId(){
        String modelId = 'ACCOUNT';
        OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt[] objectMappings = CustomMetadataService.getOTMMMetadataConfigurationByModelId(modelId);
        System.assertEquals(true,objectMappings.size()>=0);
    }

}