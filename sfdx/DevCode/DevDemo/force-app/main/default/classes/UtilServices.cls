public with sharing class UtilServices {
    public UtilServices() {

    }

    public static string getOTMMUrl(String path){
        OTMM_CONFIGURATION__mdt threatMappings=CustomMetadataService.getOTMMConfiguration();
        String url=threatMappings.OTMM_URL__c+'/otmmapi/'+threatMappings.OTMM_VERSION__c+path; 
        return url;
    }
}