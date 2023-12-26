public with sharing class OTMMSessionService {
    public OTMMSessionService() {

    }

    /*public static HttpResponse getOtmmSession(){
		OTMM_CONFIGURATION__mdt threatMappings = CustomMetadataService.getOTMMConfiguration();
		String url = threatMappings.OTMM_URL__c + '/otmmapi/' + threatMappings.OTMM_VERSION__c + '/sessions';
		System.debug('Session URL');
		String username = threatMappings.OTMM_USER_NAME__c;
		String password = threatMappings.OTMM_PASSWORD__c;
		String credentials = 'username=' + EncodingUtil.urlEncode(username, 'UTF-8') + '&password=' + EncodingUtil.urlEncode(password, 'UTF-8');
		return GenericRestServices.doPost(url, null, credentials);
    }*/
    
    //Testing the Named Credential for Security Fixes - Changed by umesh
	public static HttpResponse getOtmmSession(){
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:sfdc_otmm_credentials');
        req.setBody('username={!$Credential.Username}&password={!$Credential.Password}');
        req.setMethod('POST');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug('{!$Credential.Password}');
        System.debug(req.getBody());
        System.debug(res.getBody());
        return res;
    }
    
    
    public static Map<String, String> getSessionHeaderValues(){
		OTMM otmm = new OTMM();
		SessionResource sessionResource = new SessionResource();
		Session session = new Session();
		Map<String, String> headers = new Map<String, String>();
		HttpResponse response = getOtmmSession();
		System.debug('Session Response');
		System.debug(response.getBody());
		String cookie = response.getHeader('Set-Cookie');
		String cookieValue;
		cookieValue = cookie.substring(cookie.indexOf('=') + 1, cookie.indexOf(';'));
		//System.debug(response.getBody());
		otmm = (OTMM)JSON.deserializeStrict(response.getBody(), OTMM.class);
		sessionResource = otmm.getSessionResource();
		session = sessionResource.getSession();
		String id = session.getId();
		headers.put('X-Requested-By', id);
		headers.put('Cookie', 'JSESSIONID=' + cookieValue);
		return headers;
	}
}