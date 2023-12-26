global class SFDCTriggerHandler extends TriggerHandler  { //
    global SFDCTriggerHandler() { //SObject record, SObjectType SObjectType
    }

    public override void afterInsert() { //List<SObject> newObjects

        List<SObject> newObjects = Trigger.new;

        for(Sobject newobject: newObjects) {
            System.debug('Record Insert');
            System.debug(newobject.Id);
            TriggerServices.createFolder(newobject.Id);  
            System.debug(newobject.Id);   
        }
        
    }

    public override void afterUpdate() { //List<SObject> newRecords, List<SObject> oldRecords
        List<SObject> newRecords = Trigger.new;
        List<SObject> oldRecords = Trigger.old;
        for(Integer i=0; i < newRecords.size(); i++){
            
            Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
            System.debug(gd.get(sObjectName));
            System.debug(gd.get(sObjectName).getDescribe().fields.getMap());
            this.updateOTMMFolder(newRecords[i], oldRecords[i], newRecords[i].Id,gd);
        }

    }



    public void updateOTMMFolder(SObject newRecord,SObject oldRecord,Id recordId,Map<String, Schema.SObjectType> gd){
        
        if(newRecord.get('OTMMFolderId__c') == oldRecord.get('OTMMFolderId__c'))
        {
            Boolean isAddNameField = true;
            String nameFieldName = 'name'; 

            System.debug('Update trigger for '+sObjectName+' is called, since otmm_folder_id is not changed, other fields are changed');
            Map<String, Schema.SObjectField> fields = gd.get(sObjectName).getDescribe().fields.getMap();
    
            List<String> updatedFields = new List<String>();
            for (String str : fields.keyset()) 
            { 
                try { 
                    System.debug('Field name: '+str +'. New value: ' + newRecord.get(str) +'. Old value: '+oldRecord.get(str)); 
                    if(newRecord.get(str) != oldRecord.get(str)){ 
                        system.debug('The value has changed!!!! ');
                        updatedFields.add(str);
                    }
                } 
                catch (Exception e) { 
                    System.debug('Error: ' + e); 
                }
            } 


            for (String field : updatedFields) {
                if(field.equalsIgnoreCase(nameFieldName)){
                    isAddNameField = false;
                }
            }
            if(isAddNameField){
                updatedFields.add(nameFieldName);
            }
            if(updatedFields.size() > 0) {
                System.debug('Updated Fields');
                TriggerServices.updateFolder(recordId,updatedFields);
            }
         }

    } 
    


}