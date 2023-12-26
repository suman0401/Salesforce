public class AcheronEmpRegisterForm {
   @AuraEnabled 
    public static void RegisterForm(string en,string ef,string epo,string ed,string es){
        Employee__c emp=new Employee__c();
        emp.Name=en;
        emp.Employee_Father_Name__c=ef;
        emp.Employee_Previous_Org__c=epo;
        emp.Employee_Dept__c=ed;
        emp.Employee_Salary__c=integer.valueOf(es); //To convert from string to integer
        insert emp;
    }

}