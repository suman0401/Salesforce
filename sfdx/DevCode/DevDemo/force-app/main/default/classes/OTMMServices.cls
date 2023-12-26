public with sharing class OTMMServices{
	public OTMMServices(){
	}

	public static HttpResponse downloadAssetById(String url,Map<String,String> headers) {
		return GenericRestServices.doGet(url,headers);
	}
	public static HttpResponse deleteAssetById(String url,Map<String,String> headers,String body) {
		return GenericRestServices.doPut(url, headers, body);
	}
	//  public static HttpResponse getAssetDetails(String url,Map<String,String> headers) {
	// 	return GenericRestServices.doGet(url, headers);   
    // }
    // public static HttpResponse getOTMMUserPreference(String url,Map<String,String> headers) {    
	// 	return GenericRestServices.doGet(url, headers);
    // }

	public static HttpResponse createFolder(String url,Map<String,String> headers,String metaData) {
		return GenericRestServices.doPost(url,headers,metaData);	    
	}
	public static HttpResponse getMetaData(String url,Map<String,String> headers) {
		return GenericRestServices.doGet(url, headers);
	}
	public static HttpResponse lockFolder(String url,Map<String,String> headers,String body) {
		return GenericRestServices.doPut(url, headers,body);
	}
	public static HttpResponse unlockFolder(String url,Map<String,String> headers,String body) {
		return GenericRestServices.doPut(url, headers,body);
	}
	public static HttpResponse updateFolder(String url,Map<String,String> headers,String body) {
		return GenericRestServices.doPatch(url, headers,body);
	}

	// uploading an image
/* 	public static HttpResponse createImportJob(String url, Map<String, String> headers, Blob body, string httpMethod){
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		HttpResponse response;
		request.setEndpoint(url);
		request.setMethod(httpMethod);
		if (headers != null){
			for (String headerKey : headers.keySet()){
				System.debug(headerKey);
				System.debug(headers.get(headerKey));
				request.setHeader(headerKey, headers.get(headerKey));
			}
		}
		request.setBodyAsBlob(body);
		response = http.send(request);
		System.debug(response.getBody());
		return response;
	} */

}