({
    doInit : function(component, event, helper) {
        //var json = '{"path": "/clinics/' + recordId + '/orders"}';
       // component.set("v.canvasParameters","library");
      //  var json = '{"path": "/library/"}';
       // var json = '{"/library"}';
        //var json = '{"path": "/library"}';
        var json = '{"path": "/library/folderview?isLibrary=true"}';
        component.set("v.canvasParameters",json);
    }
})