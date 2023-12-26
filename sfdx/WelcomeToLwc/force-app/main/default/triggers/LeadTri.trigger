trigger LeadTri on Lead (before insert,after insert,before update,after update,before delete,after delete,after undelete) {
  
  if(Trigger.isdelete && Trigger.isbefore){
      LeadArch.demo(Trigger.old);
  }

}