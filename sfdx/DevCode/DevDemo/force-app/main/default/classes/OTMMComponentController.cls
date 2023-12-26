public with sharing class OTMMComponentController {
  public OTMMComponentController() {
  }

  @AuraEnabled
  public static List<String> getHeaderValues() {
    OTMM otmm = new OTMM();
		SessionResource sessionResource = new SessionResource();
		Session session = new Session();
		List<String> headers = new List<String>();
		HttpResponse response = OTMMSessionService.getOtmmSession();
		String cookie = response.getHeader('Set-Cookie');
		String cookieValue;
		cookieValue = cookie.substring(cookie.indexOf('=') + 1, cookie.indexOf(';'));
		//System.debug(response.getBody());
		otmm = (OTMM)JSON.deserializeStrict(response.getBody(), OTMM.class);
		sessionResource = otmm.getSessionResource();
		session = sessionResource.getSession();
    String id = session.getId();
    headers.add(id);
    headers.add( 'JSESSIONID=' + cookieValue);
		
		return headers;
  }

 /*  @AuraEnabled
  public static CustomApexResponse getAssetDetails(String folderId) {
    return AssetDetails.getAssetDetails(folderId);
  } */

  @AuraEnabled
  public static String getFolderDetails(String recordId) {
    //List<String> updatedFields=new List<String>();
   // return CreateFolder.CreateFolderWithMetadata(recordId);
    return '';
  }

  @AuraEnabled
  public static List<Sobject> getRecordDetails(String recordId) {
    System.debug('getRecordDetails'+recordId);
    return RecordService.getRecordDetails(recordId);
    //return CreateFolder.getRecordDetails(recordId);
  }

  @AuraEnabled
  public static String getImageFileUrl(){
      return CustomMetadataService.getOTMMConfiguration().OTMM_IMAGE_URL__c;
  }
  
  @AuraEnabled
  public static String getOTMMUrl(){
    return CustomMetadataService.getOTMMConfiguration().OTMM_URL__c;
  }
}