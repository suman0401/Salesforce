public with sharing class CustomApexResponse {

    @AuraEnabled
    public String status{ get; set; }

    @AuraEnabled
    public String message{ get; set; }

    @AuraEnabled
    public String responseMessage{ get; set; }

    @AuraEnabled
    public String statusCode{ get; set; }

    public CustomApexResponse() {

    }
}