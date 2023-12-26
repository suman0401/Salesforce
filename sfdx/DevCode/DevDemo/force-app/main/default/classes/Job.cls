public with sharing class Job {
    public JobHandle job_handle;
    public Job() {

    }
    public void setJobHandle(JobHandle jobHandle){
        this.job_handle = jobHandle; 
    }
    public JobHandle getJobHandle(){
        return this.job_handle;
    }
}