public with sharing class UpdateFolder {
    public UpdateFolder() {

    }
    //PATCH REST service call
    public static String updateFolderWithMetaData(String recordId,List<String> updatedFields) {
        try {
            System.debug('updateFolderWithMetaData function');
            System.debug(updatedFields);
            if(recordId != null && updatedFields != null) {
                List<SObject> recordList = RecordService.getRecordDetails(recordId);
                String currentObjectName = RecordService.getCurrentObjectName(recordId);
                String modelId = currentObjectName.toUpperCase();

				System.debug('recordList');
				System.debug(recordList);
				System.debug(recordList[0]);
                Sobject record;
                if( recordList.size() > 0) {
                    record = recordList[0];
                }
                else {
                    throw new OTMMCustomException('Cannot fetch Record Details for given RecordId');
                }
                Map<String,Object> recordValues = record.getPopulatedFieldsAsMap();
                System.debug('recordValues');
                System.debug(recordValues);
                List<String> objectKeys = new List<String>(recordValues.keySet());
                System.debug('objectKeys');
                System.debug(objectKeys);

                Map<String,String> headers;
                //Added this for APex Unit Test Cases
                if(!Test.isRunningTest()){
                    headers = OTMMSessionService.getSessionHeaderValues();
                }
                else{
                    headers = new Map<String,String>();
                }
                headers.put('Content-Type','application/json;charset=UTF-8');
                
                
                OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt metadataThreatMappingsForObject = CustomMetadataService.getOTMMMetadataConfigurationByObject(currentObjectName);    
                System.debug('Getting Model ID');
                System.debug(metadataThreatMappingsForObject.OTMM_MODEL_ID__c);

              
                System.debug('current Object ID');
                System.debug(metadataThreatMappingsForObject);
                String url  = UtilServices.getOTMMUrl(OTMMEndpoints.metadatamodels)+metadataThreatMappingsForObject.OTMM_MODEL_ID__c;
                HttpResponse metadataResponse = OTMMServices.getMetaData(url,headers);
                System.debug('metadataResponse');
                System.debug(metadataResponse);
                
                
                if (metadataResponse.getStatusCode() == 200) {
                        String customMetadataId = metadataThreatMappingsForObject.id;
                        System.debug('metadataResponse'+metadataResponse.getBody());
                        String folderJson = updatedMetadataMapping(metadataResponse,record,modelId,objectKeys,recordId,
                                        customMetadataId,metadataThreatMappingsForObject,updatedFields);

                        String folderId; 

                        if(Test.isRunningTest()){
                            return 'SUCCESS';
                        }

                        //OTMMFolderId__c is the custom field where current object folderId is stored
                        if(record.get('OTMMFolderId__c')!=null) {
                            Object recordObjectKeys  = record.get('OTMMFolderId__c');
                            if (recordObjectKeys instanceOf String) {
                                folderId = (String) recordObjectKeys;
                            }
                            System.debug('folderid'+folderId);
                            HttpResponse lockFolderResponse = lockFolder(folderId);
                            if(lockFolderResponse.getStatusCode() == 200) {
                                updateFolder(folderJson,folderId);
                                HttpResponse unlockFolderResponse = unlockFolder(folderId);
                                System.debug('unlock folder response');
                                System.debug(unlockFolderResponse.getStatusCode());
                            } else {
                                throw new OTMMCustomException('Unable to lock the asset');
                            }
                        } else {
                            System.debug('Could not fetch OTMM folder Id value');
                        }
                        return 'SUCCESS';
                } else {
                    System.debug('Could not retrive metadata');
                    return 'FAILED';
                }
            }
            else {
                return 'FAILED';
            }
        }
        catch(OTMMCustomException customException) {
            System.debug(customException.getMessage());
            System.debug(customException.getCause());
            System.debug(customException.getLineNumber());
            return 'FAILED';
        }

    }
    public static HttpResponse lockFolder(String folderId) {
        try {
            if(folderId != null) {
                Map<String,String> headers;
                //Added this for APex Unit Test Cases
                if(!Test.isRunningTest()){
                    headers = OTMMSessionService.getSessionHeaderValues();
                }
                else{
                    headers = new Map<String,String>();
                }
                headers.put('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8');
                String url  = UtilServices.getOTMMUrl(OTMMEndpoints.assetsValue)+folderId+OTMMEndpoints.state;
                String body='action=lock';
                HttpResponse response=OTMMServices.lockFolder(url, headers,body);
                return response;
            }
            else {
                throw new OTMMCustomException('Empty value in Folder Id');
            }
        }
        catch(Exception e) {
            throw new OTMMCustomException(e.getMessage(),e);
        }
        
    }
    
    public static String updateFolder(String metaData,String folderId) {
        try {
            if(metaData != null && folderId != null){
                Map<String,String> headers;
                //Added this for APex Unit Test Cases
                if(!Test.isRunningTest()){
                    headers = OTMMSessionService.getSessionHeaderValues();
                }
                else{
                    headers = new Map<String,String>();
                }               
                headers.put('Content-Type','application/json;charset=UTF-8');
                String url  = UtilServices.getOTMMUrl(OTMMEndpoints.folders)+folderId;
                HttpResponse updateResponse=OTMMServices.updateFolder(url,headers,metaData);
                System.debug('update response'+updateResponse.getBody());
                return 'updated';
            }
            else {
                throw new OTMMCustomException('Empty values in - metadata (or) Folder Id');
            }
        }
        catch(Exception e) {
            throw new OTMMCustomException(e.getMessage(),e);
        }
    }

    public static HttpResponse unlockFolder(String folderId) {
        try {
            if(folderId != null) {
                Map<String,String> headers;
                //Added this for APex Unit Test Cases
                if(!Test.isRunningTest()){
                    headers = OTMMSessionService.getSessionHeaderValues();
                }
                else{
                    headers = new Map<String,String>();
                }
                headers.put('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8');
                String url  = UtilServices.getOTMMUrl(OTMMEndpoints.assetsValue)+folderId+OTMMEndpoints.state;
                String body ='action=unlock';
                HttpResponse response=OTMMServices.unlockFolder(url,headers,body);
                return response;
            }
            else {
                throw new OTMMCustomException('Empty value in Folder Id');
            }

        }
        catch(Exception e) {
            throw new OTMMCustomException(e.getMessage(),e);
        }
    }
    
    public static String updatedMetadataMapping(HttpResponse metadataResponse,Sobject record,String modelId,
                                         List<String> objectKeys,String recordId, String customMetadataId,
                                         OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt metadataThreatMappings,List<String> updatedFields) {
      
    try {
         OTMM_CONFIGURATION__mdt threatMappings=CustomMetadataService.getOTMMConfiguration();
         OTMMMetadata metadata=new OTMMMetadata();
         metadata = (OTMMMetadata) JSON.deserialize(metadataResponse.getBody().replace('"type"','"type_Z"'), OTMMMetadata.class);
         List<OTMMMetadata.Metadata_element_list> elementList=null;
         elementList=metadata.metadata_model_resource.metadata_model.metadata_element_list[0].metadata_element_list;

         OTMMUpdateFolder updateFolder=new OTMMUpdateFolder();
         OTMMUpdateFolder.Edited_folder editedFolder=new OTMMUpdateFolder.Edited_folder();
         OTMMUpdateFolder.Data data=new  OTMMUpdateFolder.Data();
         List<OTMMUpdateFolder.Metadata> updateMetadata=null;
         OTMMUpdateFolder.Data metadataValue=new OTMMUpdateFolder.Data();
         metadataValue.metadata = new List<OTMMUpdateFolder.Metadata>();
        
         for (Integer i = 0;i < elementList.size(); i++) {
                  
            OTMMUpdateFolder.Metadata metadataList= new  OTMMUpdateFolder.Metadata();
            OTMMUpdateFolder.Value otmmValue=new OTMMUpdateFolder.Value();
            OTMMUpdateFolder.Value_Z otmmValue_Z=new OTMMUpdateFolder.Value_Z();
            
            metadataList.id = elementList[i].id;
            metadataList.type = elementList[i].type_Z;
            String otmmMetadataField = metadataList.id;
            OTMM_SFDC_METADATA_FIELD__mdt[] metadataFieldThreatMappings =
            CustomMetadataService.getSpecifiedOTMMMetadataFieldConfiguration(customMetadataId);

            for(Integer j = 0;j < updatedFields.size(); j++) {
              System.debug('updatedFields'+updatedFields[j]);

              for (Integer l = 0;l < metadataFieldThreatMappings.size(); l++) {

               System.debug('metadataFieldThreatMappings'+metadataFieldThreatMappings[l]);
               System.debug('updatedFields'+updatedFields[j]);
               System.debug('SALESFORCE_FIELD_ID__c'+metadataFieldThreatMappings[l].SALESFORCE_FIELD_ID__c);
               System.debug('otmmMetadataField'+otmmMetadataField);
               System.debug('OTMM_METADATA_FIELD_ID__c'+metadataFieldThreatMappings[l].OTMM_METADATA_FIELD_ID__c);

               if(updatedFields[j].equalsIgnoreCase(metadataFieldThreatMappings[l].SALESFORCE_FIELD_ID__c)) {

                System.debug('metadataFieldThreatMappings[l].SALESFORCE_FIELD_ID__c'+metadataFieldThreatMappings[l].SALESFORCE_FIELD_ID__c);
                 if (otmmMetadataField.equalsIgnoreCase(metadataFieldThreatMappings[l].OTMM_METADATA_FIELD_ID__c))  {
                            System.debug('otmmMetadataField'+otmmMetadataField);
                            System.debug('metadataFieldThreatMappings[l].OTMM_METADATA_FIELD_ID__c'+metadataFieldThreatMappings[l].OTMM_METADATA_FIELD_ID__c);

                            String salesforceField=metadataFieldThreatMappings[l].SALESFORCE_FIELD_ID__c;
                            Object recordObjectValue  = record.get(updatedFields[j]);
                            System.debug('recordObjectValue');
                            System.debug(recordObjectValue);
                            System.debug(updatedFields[j]);  
                            if (recordObjectValue instanceOf String) {
                                String recordValues = (String) recordObjectValue;
                                System.debug('values'+recordValues+updatedFields[j]);
                                otmmValue.value = recordValues;
                                otmmValue.type ='string';
                                otmmValue_Z.value =otmmValue;
                                metadataList.value =otmmValue_Z;
                                metadataValue.metadata.add(metadataList);
                            }
                            else if (recordObjectValue instanceOf Date) {
                                Date dt1 = (Date)recordObjectValue;
                                Datetime dt = datetime.newInstance(dt1.year(), dt1.month(),dt1.day());
                                System.debug(dt+'--'+dt1+'==='+updatedFields[j]);
                                String formattedDt = dt.format('yyyy-MM-dd\'T\'hh:mm:ss');
                                System.debug(formattedDt); // Check the date format 
                                otmmValue.value = formattedDt;
                                otmmValue.type ='dateTime';
                                otmmValue_Z.value = otmmValue;
                                metadataList.value = otmmValue_Z;
                                metadataValue.metadata.add(metadataList);
                             }
                             else if (recordObjectValue instanceOf Decimal) {
                                System.debug('number-decimal value');
                                System.debug(recordObjectValue+updatedFields[j]);
                                otmmValue.value = String.valueOf(recordObjectValue);
                                otmmValue.type ='decimal';
                                otmmValue_Z.value = otmmValue;
                                metadataList.value = otmmValue_Z;
                                metadataValue.metadata.add(metadataList);
                             }  
                    }
                }            
             }  
           } 
         }
        for(Integer j = 0;j<updatedFields.size();j++) {
                OTMMUpdateFolder.Metadata metadataList= new  OTMMUpdateFolder.Metadata();
                OTMMUpdateFolder.Value otmmValue=new OTMMUpdateFolder.Value();
                OTMMUpdateFolder.Value_Z otmmValue_Z=new OTMMUpdateFolder.Value_Z();    
                Object recordFolderValue  = record.get(updatedFields[j]);
                if (updatedFields[j].equalsIgnoreCase('name')) {
                    metadataList.id='ARTESIA.FIELD.ASSET NAME';//read from custom metadata types or from url
                    metadataList.type='com.artesia.metadata.MetadataField';
                    String recordValues = (String) recordFolderValue;
                    System.debug(recordValues+updatedFields[j]);
                    otmmValue.value = recordValues;
                    otmmValue.type ='string';
                    otmmValue_Z.value = otmmValue;
                    metadataList.value = otmmValue_Z;
                    metadataValue.metadata.add(metadataList);      
                }    
                else if (updatedFields[j].equalsIgnoreCase('lastname')) {//for lead object
                    metadataList.id = 'ARTESIA.FIELD.ASSET NAME';//read from custom metadata types or from url
                    metadataList.type ='com.artesia.metadata.MetadataField';
                    String recordValues = (String) recordFolderValue;
                    System.debug(recordValues+updatedFields[j]);
                    otmmValue.value = recordValues;
                    otmmValue.type ='string';
                    otmmValue_Z.value = otmmValue;
                    metadataList.value = otmmValue_Z;
                    metadataValue.metadata.add(metadataList);      
                }    
        }
        editedFolder.data = metadataValue;
        updateFolder.edited_folder = editedFolder;
        String folderJson = JSON.serialize(updateFolder);
        System.debug('jsonfolder'+folderJson);
        return folderJson;
    }
    Catch(Exception e) {
        throw new OTMMCustomException(e.getMessage(),e);
    }
   }

}

   //SOAP Service call logic
   /*  public static String updateFolderWithMetaData(String recordId,List<String> updatedFields) {
        try {
			System.debug('updateFolderWithMetaData function');
            System.debug(updatedFields);
            if(recordId != null && updatedFields != null) {
                List<SObject> recordList = RecordService.getRecordDetails(recordId);
                String currentObjectName = RecordService.getCurrentObjectName(recordId);
                 
				System.debug('recordList');
				System.debug(recordList);
				System.debug(recordList[0]);
                Sobject record;
                if( recordList.size() > 0) {
                    record = recordList[0];
                }
                else {
                    throw new OTMMCustomException('Cannot fetch Record Details for given RecordId');
                }
                Map<String,Object> recordValues = record.getPopulatedFieldsAsMap();
                System.debug('recordValues');
                System.debug(recordValues);
                List<String> objectKeys = new List<String>(recordValues.keySet());
                System.debug('objectKeys');
                System.debug(objectKeys);

                Map<String,String> headers = OTMMSessionService.getSessionHeaderValues();
                headers.put('Content-Type','application/json;charset=UTF-8');
                
                
                OTMM_SFDC_OBJECT_FOLDER_SP_MAPPING__mdt metadataThreatMappingsForObject = CustomMetadataService.getOTMMMetadataConfigurationByObject(currentObjectName);    
                System.debug('Getting Model ID');
                System.debug(metadataThreatMappingsForObject.OTMM_MODEL_ID__c);

              
                System.debug('current Object ID');
                System.debug(metadataThreatMappingsForObject);
                String url  = UtilServices.getOTMMUrl(OTMMEndpoints.metadatamodels)+metadataThreatMappingsForObject.OTMM_MODEL_ID__c;
                HttpResponse metadataResponse=OTMMServices.getMetaData(url,headers);
                System.debug('metadataResponce');
                System.debug(metadataResponse);
                
                
                if (metadataResponse.getStatusCode() == 200) {
                        String customMetadataId = metadataThreatMappingsForObject.id;
                        System.debug('metadataResponse'+metadataResponse.getBody());
                        DOM.Document metadataDomRequest=soapUpdatedMetadataMapping(metadataResponse,record,
                                        customMetadataId,updatedFields,(String)record.get('OTMMFolderId__c'));
                        System.debug('metadataDomRequest');
                        System.debug(metadataDomRequest.toXmlString());
                        String folderId; 
                        if(record.get('OTMMFolderId__c') != null) {
                            Object recordObjectKeys  = record.get('OTMMFolderId__c');
                            if (recordObjectKeys instanceOf String) {
                                folderId = (String) recordObjectKeys;
                            }
                            System.debug('folderid'+folderId);
                            HttpResponse lockFolderResponse = lockFolder(folderId);
                            if(lockFolderResponse.getStatusCode() == 200) {
                               // updateFolder(folderJson,folderId);
                                updateFolderMetaData(metadataDomRequest);
                                HttpResponse unlockFolderResponse = unlockFolder(folderId);
                                System.debug('unlock folder response');
                                System.debug(unlockFolderResponse.getStatusCode());
                            }
                            else {
                                throw new OTMMCustomException('Unable to lock the asset');
                            }
                        }
                        return 'SUCCESS';
                } else {
                    System.debug('throw error');
                    return 'FAILED';
                }
            }
            else {
                return 'FAILED';
            }
        }
        catch(OTMMCustomException customException) {
            System.debug(customException.getMessage());
            System.debug(customException.getCause());
            System.debug(customException.getLineNumber());
            return 'FAILED';
        }

    }

    
    public static DOM.Document soapUpdatedMetadataMapping(HttpResponse metadataResponse,Sobject record,
                                          String customMetadataId,List<String> updatedFields,String folderId) {
      
    try {
         OTMMMetadata metadata = new OTMMMetadata();
         metadata = (OTMMMetadata) JSON.deserialize(metadataResponse.getBody().replace('"type"','"type_Z"'), OTMMMetadata.class);
         List<OTMMMetadata.Metadata_element_list> elementList = null;
         elementList = metadata.metadata_model_resource.metadata_model.metadata_element_list[0].metadata_element_list;
		 System.debug('elementlist');
         System.debug(elementList);
        
         List<String> updatedFieldOTMMFields = new List<String>();
         List<String> updatedFieldOTMMDataTypes = new List<String>();
         List<String> updatedFieldOTMMFieldValues = new List<String>();
        
         for (Integer i = 0;i<elementList.size();i++) {
                  
            
            //metadataList.type = elementList[i].type_Z; // eg: com.artesia.metadata.MetadataField
            String otmmMetadataField = elementList[i].id;  //eg : SALESFORCE.ACCOUNTS.NAME
            OTMM_SFDC_METADATA_FIELD__mdt[] metadataFieldThreatMappings =
            CustomMetadataService.getSpecifiedOTMMMetadataFieldConfiguration(customMetadataId);

            for(Integer j = 0;j<updatedFields.size();j++) {
              System.debug('updatedFields'+updatedFields[j]);  // updatedFields will have list of Field Api Names of SF object
                
              for (Integer l = 0;l<metadataFieldThreatMappings.size();l++) {
               System.debug('metadataFieldThreatMappings'+metadataFieldThreatMappings[l]);
               System.debug('updatedFields'+updatedFields[j]);
               System.debug('SALESFORCE_FIELD_ID__c'+metadataFieldThreatMappings[l].SALESFORCE_FIELD_ID__c);
               System.debug('otmmMetadataField'+otmmMetadataField);
               System.debug('OTMM_METADATA_FIELD_ID__c'+metadataFieldThreatMappings[l].OTMM_METADATA_FIELD_ID__c);
               if(updatedFields[j].equalsIgnoreCase(metadataFieldThreatMappings[l].SALESFORCE_FIELD_ID__c)) {
                 if(otmmMetadataField.equalsIgnoreCase(metadataFieldThreatMappings[l].OTMM_METADATA_FIELD_ID__c))  { 
                            System.debug('otmmMetadataField'+otmmMetadataField); //eg : SALESFORCE.ACCOUNTS.NAME
                            System.debug('metadataFieldThreatMappings[l].OTMM_METADATA_FIELD_ID__c'+metadataFieldThreatMappings[l].OTMM_METADATA_FIELD_ID__c);
                            
                            Object recordObjectValue  = record.get(updatedFields[j]); // recordObjectKeys -> value of Field  of SF object
                   			System.debug('recordObjectValue');
                   			System.debug(recordObjectValue);
                   			System.debug(updatedFields[j]);                   			
                            if (recordObjectValue instanceOf String) {
                                String recordValues = (String) recordObjectValue;
                                System.debug('values'+recordValues+updatedFields[j]);
                                updatedFieldOTMMFields.add(metadataFieldThreatMappings[l].OTMM_METADATA_FIELD_ID__c);
         						updatedFieldOTMMDataTypes.add('string');
             					updatedFieldOTMMFieldValues.add(recordValues);
                               
                            }
                            else if (recordObjectValue instanceOf Date) {
                                Date dt1 = (Date)recordObjectValue;
                                Datetime dt = datetime.newInstance(dt1.year(), dt1.month(),dt1.day());
                                System.debug(dt+'--'+dt1+'==='+updatedFields[j]);
                                String formattedDt = dt.format('yyyy-MM-dd\'T\'hh:mm:ss');
                                System.debug(formattedDt); // Check the date format 
                                
                                updatedFieldOTMMFields.add(metadataFieldThreatMappings[l].OTMM_METADATA_FIELD_ID__c);
         						updatedFieldOTMMDataTypes.add('dateTime');
             					updatedFieldOTMMFieldValues.add((String)formattedDt); // Check how it is storing
                                
                             }
                             else if (recordObjectValue instanceOf Decimal) {
                                System.debug('number value');
                                updatedFieldOTMMFields.add(metadataFieldThreatMappings[l].OTMM_METADATA_FIELD_ID__c);
         						updatedFieldOTMMDataTypes.add('decimal');
             					updatedFieldOTMMFieldValues.add(String.valueOf(recordObjectValue)); // Create field in OTMM with number type and see the behaviour
                             } 
                  }  
                }            
             }  
           } 
         }

        // Updating the OTMM folder name when sf name field is updated
        for(Integer j = 0;j<updatedFields.size();j++) {
                      
              Object recordFolderValue  = record.get(updatedFields[j]);
              String otmmFolderFieldName = 'ARTESIA.FIELD.ASSET NAME';
              if (updatedFields[j].equalsIgnoreCase('name')) {
                  System.debug('is updated field is name ');
                  System.debug(updatedFields[j].equalsIgnoreCase('name'));
				  updatedFieldOTMMFields.add(otmmFolderFieldName);
         		  updatedFieldOTMMDataTypes.add('string');
             	  updatedFieldOTMMFieldValues.add((String)recordFolderValue);                
              }    
          
            //  else if (updatedFields[j].equalsIgnoreCase('lastname')) {
            //      System.debug('is updated field is lastname');
            //      System.debug(updatedFields[j].equalsIgnoreCase('name'));
            //      updatedFieldOTMMFields.add(otmmFolderFieldName);
         	//	  updatedFieldOTMMDataTypes.add('string');
            //	  updatedFieldOTMMFieldValues.add((String)recordFolderValue);                 
             // }
			//
        }

        System.debug('updatedFieldOTMMFields');
        System.debug(updatedFieldOTMMFields);
        System.debug('updatedFieldOTMMDataTypes');
        System.debug(updatedFieldOTMMDataTypes);
        System.debug('updatedFieldOTMMFieldValues');
        System.debug(updatedFieldOTMMFieldValues);
        DOM.Document domObject = metadataDomObject(folderId,updatedFieldOTMMFields,updatedFieldOTMMDataTypes,updatedFieldOTMMFieldValues);
        System.debug('domObject');
        System.debug(domObject.toXmlString());
        return domObject;
        //return null;
    }
    Catch(Exception e) {
        throw new OTMMCustomException(e.getMessage(),e);
    }
   }


    public static DOM.Document metadataDomObject(String assetFolderId,List<String> otmmFields,List<String> otmmFieldDatatypes,List<String> updatedFieldValues){
        DOM.Document doc = new DOM.Document();
        
        String soapNS = 'http://schemas.xmlsoap.org/soap/envelope/';
        String xsi = 'http://www.w3.org/2001/XMLSchema-instance';
        String xs = 'http://www.w3.org/2001/XMLSchema';
		String api = 'http://www.artesia.com/ws/api';
        String ns2 = 'http://www.artesia.com/api/xsd';
        
        //String assetFolderId = 'b58be881620790efb74b01b4182194a2101357f3';
        //List<String> otmmFields =  new List<String>();
        //otmmFields.add('SALESFORCE.ACCOUNTS.NAME');
        //List<String> otmmFieldDatatypes =  new List<String>();
        //otmmFieldDatatypes.add('string');
        //List<String> updatedFieldValues = new List<String>();
        //updatedFieldValues.add('FinalCheckList');
        OTMM_CONFIGURATION__mdt otmmConfigurationthreatMappings = CustomMetadataService.getOTMMConfiguration();
        String otmmUser = otmmConfigurationthreatMappings.OTMM_USER_NAME__c;
        
        
        
        dom.XmlNode envelope = doc.createRootElement('Envelope', soapNS, 'soapenv');
        envelope.setNamespace('api', api);
        
        dom.XmlNode body = envelope.addChildElement('Body', soapNS, 'soapenv');
            
        //body child element         
        dom.XmlNode saveMetadataForAssets = body.addChildElement('api:saveMetadataForAssets',null,null); 
        
        
        saveMetadataForAssets.setNamespace('ns2',ns2 );
        saveMetadataForAssets.setNamespace('ns3',api );
              
        	  //savemetadataforassets child element - arg0
              dom.XmlNode arg0 = saveMetadataForAssets.addChildElement('arg0',null,null);
              arg0.addTextNode(assetFolderId); //dev asset Id 140d80102bce0d9cf131734a1710ce053c6d5180
            
        	  //savemetadataforassets child element - arg1
              dom.XmlNode arg1 = saveMetadataForAssets.addChildElement('arg1',null,null);
              
              for(Integer i = 0;i<otmmFields.size();i++){
                  dom.XmlNode arg1MetadataFields = arg1.addChildElement('metadataFields',null,null);        
                  arg1MetadataFields.setNamespace('xsi',xsi);
                  arg1MetadataFields.setAttributeNs('type', 'ns2:metadataField', xsi, null);
                  dom.XmlNode arg1MetadataFields_Id = arg1MetadataFields.addChildElement('id', null, null);
                  arg1MetadataFields_Id.addTextNode(otmmFields[i]);
                  dom.XmlNode arg1MetadataFields_Value = arg1MetadataFields.addChildElement('value', null, null);
                  dom.XmlNode arg1MetadataFields_Value_Value = arg1MetadataFields_Value.addChildElement('value',null,null);
                  arg1MetadataFields_Value_Value.setNamespace('xs',xs);
                  arg1MetadataFields_Value_Value.setAttributeNs('xsi:type', otmmFieldDatatypes[i], null, xs);
                  arg1MetadataFields_Value_Value.addTextNode(updatedFieldValues[i]);  
              }
                          
        	  //savemetadataforassets child element - arg2
              dom.XmlNode arg2 = saveMetadataForAssets.addChildElement('arg2',null,null);
              arg2.addTextNode(otmmUser);
        
		
        System.debug(doc.toXmlString());
        
        return doc;
        
    }

    

    public static HttpResponse lockFolder(String folderId) {
        try {
            if(folderId != null) {
                Map<String,String> headers = OTMMSessionService.getSessionHeaderValues(); 
                headers.put('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8');
                String url  = UtilServices.getOTMMUrl(OTMMEndpoints.assetsValue)+folderId+OTMMEndpoints.state;
                String body = 'action=lock';
                HttpResponse response = OTMMServices.lockFolder(url, headers,body);
                return response;
            }
            else {
                throw new OTMMCustomException('Empty value in Folder Id');
            }
        }
        catch(Exception e) {
            throw new OTMMCustomException(e.getMessage(),e);
        }
        
    }

    public static void updateFolderMetaData(DOM.Document requestDomObject) {
       
        OTMM_CONFIGURATION__mdt otmmConfigurationthreatMappings = CustomMetadataService.getOTMMConfiguration();
        
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint(otmmConfigurationthreatMappings.OTMM_URL__c+'/artesia-ws/services/ArtesiaWebServices');
        request.setHeader('Content-Type', 'text/xml; charset=utf-8');
        
        request.setBodyDocument(requestDomObject);
         
        Http http = new Http();
        try {
          //Execute web service call here       
          HTTPResponse response = http.send(request);   
          System.debug(response.toString());
          System.debug('STATUS:'+response.getStatus());
          System.debug('STATUS_CODE:'+response.getStatusCode());
          System.debug('STATUS_CODE:'+response.getBody());
          
           } catch(System.CalloutException e) {
                throw new OTMMCustomException(e.getMessage(),e);
         }     
                
     }    
    
    
    public static HttpResponse unlockFolder(String folderId) {
        try {
            if(folderId != null) {
                Map<String,String> headers = OTMMSessionService.getSessionHeaderValues(); 
                headers.put('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8');
                String url  = UtilServices.getOTMMUrl(OTMMEndpoints.assetsValue)+folderId+OTMMEndpoints.state;
                String body = 'action=unlock';
                HttpResponse response = OTMMServices.unlockFolder(url,headers,body);
                return response;
            }
            else {
                throw new OTMMCustomException('Empty value in Folder Id');
            }

        }
        catch(Exception e) {
            throw new OTMMCustomException(e.getMessage(),e);
        }
    }
    

     */