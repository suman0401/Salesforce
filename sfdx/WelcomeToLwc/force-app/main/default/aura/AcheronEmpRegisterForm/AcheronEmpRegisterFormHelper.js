({
	helperMethod : function(cmp,event) {
        alert("I am from helper");
         var emn=cmp.get("v.eName");
        alert('Name is ='+emn);
        
         var empFName=cmp.get("v.eFatherName");
        alert('Father Name is ='+empFName);
        
         var empPOrg=cmp.get("v.ePreOrg");
        alert('Previous Org is ='+empPOrg);
        
         var empDpt=cmp.get("v.eDept");
        alert('Dept is ='+empDpt);
        
         var empSal=cmp.get("v.eSalary");
        alert('Salary is ='+empSal);
        //create a one-time use instance of the AcheronEmpRegisterForm
        //in the server-side controller
        var action=cmp.get("c.RegisterForm");
        action.setParams({
            en:emn,
            ef:empFName,
            epo:empPOrg,
            ed:empDpt,
            es:empSal
           
        });
        //Create a callback that is executes after
        //the server-side action returns
        action.setCallback(this,function(response){
             var state=response.getState();
        if(state ==="SUCCESS"){
            //Alert the user with the value returned
            //from the server
            alert("From the Server: Values Insertesd Successfully");
         }
   });
        //entry point
		$A.enqueueAction(action);
	}
})