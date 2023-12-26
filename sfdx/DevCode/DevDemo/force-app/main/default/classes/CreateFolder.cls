public with sharing class CreateFolder{
	public CreateFolder(){
    }
	public static HttpResponse createFolder(String metaData,String url) {
         try {
            System.debug('Create Folder Metadata'+metaData);
            System.debug('Create Folder URL'+url);
            //Added this for Apex Unit Test Cases
            Map<String,String> headers;
            if(!Test.isRunningTest()){
                headers = OTMMSessionService.getSessionHeaderValues();
            }
            else {
                headers = new Map<String,String>();
            }

            headers.put('Content-Type','application/json;charset=UTF-8');
            OTMM_CONFIGURATION__mdt threatMappings=CustomMetadataService.getOTMMConfiguration();
            HttpResponse folderResponse=OTMMServices.createFolder(url,headers,metaData);
            return folderResponse;
         }
         catch(Exception e) {
             System.debug(e.getMessage());
             throw new OTMMCustomException('Folder Could not be created',e);
         }
     }
     public static List<String> getRecordValues(String recordId) {
        List<String> listValues;
        try {
            List<SObject> recordList=RecordService.getRecordDetails(recordId);
            String currentObjectName=RecordService.getCurrentObjectName(recordId);
            Sobject record=recordList[0];
            record.getSObjectType();
            System.debug(record.getPopulatedFieldsAsMap());
            Map<String,Object> recordValues=record.getPopulatedFieldsAsMap();
            listValues = new List<String>(recordValues.keySet());
            System.debug(listValues);
        }
        catch(Exception e) {
            System.debug(e.getMessage());
        }
        return listValues;
    }
      public static String metadataMapping(HttpResponse metadataResponse,Sobject record,String modelId,
                                         List<String> objectKeys,String customMetadataId,String name) {
        System.debug('metadataMapping function');
        try {                              
            OTMM_CONFIGURATION__mdt threatMappings=CustomMetadataService.getOTMMConfiguration();
            List<OTMMMetadata.Metadata_element_list> elementList=null;
            OTMMFolder otmmFolder=new OTMMFolder();
            OTMMFolder.Folder_resource folderResource=new OTMMFolder.Folder_resource();
            OTMMFolder.Folder folder=new OTMMFolder.Folder();
            OTMMFolder.Metadata metadataValue=new OTMMFolder.Metadata();
            OTMMMetadata metadata=new OTMMMetadata();
            if(metadataResponse != null) {
                 metadata = (OTMMMetadata) JSON.deserialize(metadataResponse.getBody().replace('"type"','"type_Z"'), OTMMMetadata.class); 
                 elementList=metadata.metadata_model_resource.metadata_model.metadata_element_list[0].metadata_element_list;
            }
            metadataValue.metadata_element_list = new List<OTMMFolder.Metadata_element_list>();
            if(elementList !=null) {
                for (Integer i=0;i<elementList.size();i++) {
                                
                    OTMMFolder.Metadata_element_list metadataElementList=new OTMMFolder.Metadata_element_list();
                    OTMMFolder.Value otmmValue=new OTMMFolder.Value();
                    OTMMFolder.Value_Z otmmValue_Z=new OTMMFolder.Value_Z();
                    metadataElementList.id=elementList[i].id;
                    metadataElementList.type=elementList[i].type_Z;
                    String otmmMetadataField = metadataElementList.id;
        
                    if(customMetadataId != null) {
                        OTMM_SFDC_METADATA_FIELD__mdt[] metadataFieldThreatMappings=
                        CustomMetadataService.getSpecifiedOTMMMetadataFieldConfiguration(customMetadataId);
                
                    for (Integer l=0;l<metadataFieldThreatMappings.size();l++) {
                        System.debug('metadataFieldThreatMappings'+metadataFieldThreatMappings[l].OTMM_METADATA_FIELD_ID__c);
                        System.debug('otmmMetadataField'+otmmMetadataField);
                        if (otmmMetadataField.equalsIgnoreCase(metadataFieldThreatMappings[l].OTMM_METADATA_FIELD_ID__c))  {
                            System.debug('metadataFieldThreatMappings'+metadataFieldThreatMappings[l].OTMM_METADATA_FIELD_ID__c+'otmmMetadataField'+otmmMetadataField);
                       		 System.debug('metadataFieldThreatMappings[l].SALESFORCE_FIELD_ID__c'+metadataFieldThreatMappings[l].SALESFORCE_FIELD_ID__c);
                            String salesforceField=metadataFieldThreatMappings[l].SALESFORCE_FIELD_ID__c;
                             if (objectKeys != null) {
                                for (Integer j=0;j < objectKeys.size();j++) {       
                                    if (salesforceField.equalsIgnoreCase(objectKeys[j])) { 
                                        System.debug('salesforceField.equalsIgnoreCase(objectKeys[j])'+salesforceField+'--'+objectKeys[j]);
                                        Object recordObjectKeys  = record.get(objectKeys[j]);
                                        if (recordObjectKeys instanceOf String) {
                                            String recordValues = (String) recordObjectKeys;
                                            System.debug(recordValues+objectKeys[j]);
                                            otmmValue.value= recordValues;
                                            otmmValue.type='string';
                                            otmmValue_Z.value=otmmValue;
                                            metadataElementList.value=otmmValue_Z;
                                            metadataValue.metadata_element_list.add(metadataElementList);
                                        }
                                        else if (recordObjectKeys instanceOf Date) {
                                            Date dt1=(Date)recordObjectKeys;
                                            Datetime dt = datetime.newInstance(dt1.year(), dt1.month(),dt1.day());
                                            System.debug(dt+'--'+dt1+'==='+objectKeys[j]);
                                            String formattedDt = dt.format('yyyy-MM-dd\'T\'hh:mm:ss');
                                            System.debug(formattedDt);
                                            otmmValue.value= formattedDt;
                                            otmmValue.type='dateTime';
                                            otmmValue_Z.value=otmmValue;
                                            metadataElementList.value=otmmValue_Z;
                                            metadataValue.metadata_element_list.add(metadataElementList);
                                        }
                                        else if (recordObjectKeys instanceOf Decimal) {
                                            //Integer recordIntegerValues = (Integer) recordObjectKeys;
                                            //String recordValues = ''+recordIntegerValues;
                                            //System.debug(recordValues+objectKeys[j]);
                                            otmmValue.value= String.valueOf(recordObjectKeys);
                                            otmmValue.type='decimal';
                                            otmmValue_Z.value=otmmValue;
                                            metadataElementList.value=otmmValue_Z;
                                            metadataValue.metadata_element_list.add(metadataElementList);
                                        }
                                    }
                                }
                            }     
                        }          
                    }  
                  }                
                } 
            }

            //OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt[] metadataThreatMappings=CustomMetadataService.getOTMMMetadataConfigurationByModelId(modelId);
            OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt metadataThreatMappings=CustomMetadataService.getOTMMMetadataConfigurationByObject(modelId);
            System.debug('container_type_id & model id'+metadataThreatMappings.OTMM_FOLDER_ID__c+'--'+metadataThreatMappings.OTMM_MODEL_ID__c);
            folder.container_type_id=metadataThreatMappings.OTMM_FOLDER_TYPE_ID__c;//mapping config//
            folder.metadata_model_id=metadataThreatMappings.OTMM_MODEL_ID__c;
            
            folder.name = record !=null?(String)record.get('name'):name;
            folder.security_policy_list = new List<OTMMFolder.Security_policy_list>();   
                                            
            String securityPolicy=metadataThreatMappings.OTMM_SECURITY_POLICIES__c;
            if(securityPolicy !=null && String.isNotBlank(securityPolicy)) {
                if(securityPolicy.contains(',')) {
                    String[] securityList=securityPolicy.split(',');
                    for(Integer i=0;i<securityList.size();i++) {
                        OTMMFolder.Security_policy_list security=new OTMMFolder.Security_policy_list();         
                        security.id=Integer.valueof(securityList[i].trim());
                        folder.security_policy_list.add(security);
                    }
                }
                else {
                    OTMMFolder.Security_policy_list security=new OTMMFolder.Security_policy_list();         
                    security.id=Integer.valueof(securityPolicy.trim());
                    folder.security_policy_list.add(security);
                }
            }
            folder.metadata=metadataValue;
            folderResource.folder=folder;
            otmmFolder.folder_resource=folderResource;  
            String folderJson=JSON.serialize(otmmFolder);
            System.debug('jsonfolder'+folderJson);
            return folderJson;
        }
        Catch(Exception e) {
            throw new OTMMCustomException(e.getMessage(),e);
        }
     }

     public static String CreateFolderWithMetadata(String recordId) {
         System.debug('CreateFolderWithMetadata');
        try {
                if(recordId != null) {
                    List<SObject> recordList=RecordService.getRecordDetails(recordId);
                    String currentObjectName=RecordService.getCurrentObjectName(recordId);
                    String modelId=currentObjectName.toUpperCase();
                    Sobject record=recordList[0];
                    Map<String,Object> recordValues=record.getPopulatedFieldsAsMap();
                    List<String> objectKeys = new List<String>(recordValues.keySet());
                    System.debug('objectKeys');
                    System.debug(objectKeys);
                    System.debug(objectKeys.size());
                    System.debug(record.get(objectKeys[0]));
                    Map<String,String> headers;
                    //Added this for APex Unit Test Cases
                    if(!Test.isRunningTest()){
                        headers = OTMMSessionService.getSessionHeaderValues();
                    }
                    else{
                        headers = new Map<String,String>();
                    }
                    
                    OTMM_CONFIGURATION__mdt threatMappings=CustomMetadataService.getOTMMConfiguration();
                    //OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt[] metadataThreatMappings=CustomMetadataService.getOTMMMetadataConfiguration();
                    Integer currentObject=0;
                    /*for(Integer i=0;i<metadataThreatMappings.size();i++) {
                        System.debug('metadataThreatMappings[i].SFDC_OBJECT_NAME__c'+metadataThreatMappings[i].SFDC_OBJECT_NAME__c);
                        System.debug('modelId'+modelId);
           
                        if (metadataThreatMappings[i].SFDC_OBJECT_NAME__c.equalsIgnoreCase(modelId)) {
                                currentObject=i;
                                break;
                        }
                    }*/
                    OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt metadataThreatMappings=CustomMetadataService.getOTMMMetadataConfigurationByObject(modelId);
                    
                    System.debug(currentObject+metadataThreatMappings.OTMM_FOLDER_ID__c);
                    System.debug(metadataThreatMappings.id);
                    String url  = UtilServices.getOTMMUrl(OTMMEndpoints.metadatamodels)+metadataThreatMappings.OTMM_MODEL_ID__c;
                    HttpResponse metadataResponse=OTMMServices.getMetaData(url,headers);
                    System.debug('metadataResponse');
                    System.debug(metadataResponse.getBody());
                    System.debug(metadataResponse.getStatusCode());
                    Map<String,String> folderValues=new Map<String,String>();
                    if (metadataResponse.getStatusCode() == 200) {
                            String customMetadataId=metadataThreatMappings.id;
                            System.debug('calling metadataMapping function');
                            String folderJson=metadataMapping(metadataResponse,record,modelId,objectKeys,customMetadataId,null);
                            url=UtilServices.getOTMMUrl(OTMMEndpoints.folders)+metadataThreatMappings.OTMM_FOLDER_ID__c;
                            HttpResponse createFolderResponse=createFolder(folderJson,url);
                            if(createFolderResponse.getStatusCode() == 200) {
                                FolderCreationResponse folderCreationResponse=new FolderCreationResponse();
                                folderCreationResponse = (FolderCreationResponse) JSON.deserialize(createFolderResponse.getBody(), FolderCreationResponse.class); 
                                RecordService.updateFolderId(recordId,folderCreationResponse.Folder_resource.Folder.asset_id);
                            }   
                        return 'SUCCESS';
                     }  else {
                                System.debug('throw error');
                                return 'FAILED';//throw exception
                     } 
                }
                else {
                    return 'FAILED';
                }
              
            }
        catch(Exception e) {
                    System.debug(e.getMessage());
                    System.debug(e.getCause());
                    System.debug(e.getLineNumber());
                    return 'FAILED';
        }
    }
    public static CustomApexResponse createBasicFolder(String modelId,String name,String parentFolderId) {
        CustomApexResponse response = new CustomApexResponse();
        try{
            System.debug('Creating Basic Folder');
            if(modelId == null || name ==null || parentFolderId ==null){
                throw new OTMMCustomException('Mandatory parameters are missing to create Folder ');
            }
            String url = UtilServices.getOTMMUrl(OTMMEndpoints.folders)+parentFolderId;
            OTMM_CONFIGURATION__mdt threatMappings=CustomMetadataService.getOTMMConfiguration();
            OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt metadataThreatMappings=CustomMetadataService.getSpecificOTMMMetadataConfigurationByModelId(modelId);
            System.debug('metadataThreatMappings');
            System.debug(metadataThreatMappings);
            String folderJson = metadataMapping(null,null,modelId,null,null,name);
            Map<String,String> headers=OTMMSessionService.getSessionHeaderValues();
            headers.put('Content-Type','application/json;charset=UTF-8'); 
            HttpResponse folderResponse=OTMMServices.createFolder(url,headers,folderJson);
            if ( folderResponse.getStatusCode() == 200 ) {
                response.status = folderResponse.getStatus();
                response.statusCode = folderResponse.getStatusCode()+'';
                response.message = 'Success';
                response.responseMessage = folderResponse.getBody();
            }
            else {
                response.status = folderResponse.getStatus();
                response.statusCode = folderResponse.getStatusCode()+'';
                response.message = 'Error';
                response.responseMessage = folderResponse.getBody();
            }
        }
        catch(Exception e){
            response.status = 'Internal Error';
            response.statusCode = '400';
            response.message = e.getMessage();
            response.responseMessage = 'Error occured while creating folder: ' + e.getMessage() + ' at line number: ' +e.getLineNumber() ;
        }
        return response;
    }
     
}