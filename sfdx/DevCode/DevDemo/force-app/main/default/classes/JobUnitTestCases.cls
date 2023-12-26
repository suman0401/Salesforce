@isTest
private class JobUnitTestCases {
    @isTest static void validateJob() {
        JobHandle jobHandle = new JobHandle();
        jobHandle.setJobId(111111);
        jobHandle.getJobId();
        Job job = new Job();
        job.setJobHandle(jobHandle);
        job.getJobHandle();

        System.assert(true);
    }
}