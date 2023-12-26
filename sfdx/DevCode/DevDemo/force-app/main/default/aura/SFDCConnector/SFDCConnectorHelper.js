({
	helperMethod : function() {
		
	},
    getRecordFolderIdValues : function(component, index) {
    console.log('get record');
    component.set("v.loaded", false);
    var local=this;
    var action = component.get('c.getRecordDetails'); //component.get('c.getTest');
    console.log('In get folder id ');

    action.setParams({
      recordId : component.get('v.recordId')
    });
    action.setCallback(this,function(response){
      local.getRecordDetailsCallback(response,component,index)
    }); 
    $A.enqueueAction(action);
  }, getRecordDetailsCallback : function(response,component,index) {
      var local=this;
      console.log('response');
      console.log(response);
      var responseValue = response.getReturnValue();
      console.log("Record Details-responseValue", responseValue);
      if(responseValue[0].OTMMFolderId__c != null) {

        component.set('v.loaded',true);
        console.log('folder id-RecordDetails'+responseValue[0].OTMMFolderId__c);
        $A.get("e.force:refreshView").fire();
      }
      else {
          if(index < 8) {
             /* pollId = window.setInterval(
              $A.getCallback(function() {
                  local.getRecordFolderIdValues(component,index,pollId);
              }), 2000
           );   */
           local.getRecordFolderIdValues(component,index+1);   
          }
          component.set('v.emptyFolder',false);
   
       }
       console.log('after folder id-RecordDetails'+responseValue[0].OTMMFolderId__c);
  }
})