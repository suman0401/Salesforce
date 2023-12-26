({
	
    recordUpdate: function(component, event, helper) {
        console.log('RecordId'+component.get('v.recordId'));
        var index = 1;
      	
        if (component.get("v.record").OTMMFolderId__c == null) {//otmmfolderid
           console.log('folder id-empty');
            component.set("v.emptyFolder", true);
            helper.getRecordFolderIdValues(component,index);
           //component.set("v.loaded", false);
        }
        else {
         console.log('folder id'+component.get("v.record").OTMMFolderId__c);
         var folderId =component.get("v.record").OTMMFolderId__c;
         var folderId =  component.get("v.record").OTMMFolderId__c;
         var json = '{"path": "/folders/' +folderId +'"}';
         component.set("v.parameters", json);
         component.set("v.loaded", true);
            
        } 
    },
    doInit: function(component) {
        var recordId = component.get("v.recordId");
         
         //component.set("v.parameters", recordId)
        //var json = '{"path": "/clinics/' + recordId + '/orders"}';
        //var folderId =  component.get("v.record").OTMMFolderId__c;
        //var json = '{"path": "/folders/' +folderId +'/"}';
        //component.set("v.parameters", json);
    }
})