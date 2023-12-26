public with sharing class GenericRestServices{
	public GenericRestServices(){
	}

	public static HttpResponse doGet(String url, Map<String, String> headers){
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		HttpResponse response;
		request.setEndpoint(url);
		request.setMethod('GET');
		if (headers != null){
			for (String headerKey : headers.keySet()){
				System.debug(headerKey);
				System.debug(headers.get(headerKey));
				request.setHeader(headerKey, headers.get(headerKey));
			}
		}
		response = http.send(request);
		//System.debug('HTTP GET Method', response.getBody());
		return response;
	}

	public static HttpResponse doPost(String url, Map<String, String> headers, String body){
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		HttpResponse response;
		request.setEndpoint(url);
		request.setMethod('POST');
		if (headers != null){
			for (String headerKey : headers.keySet()){
				System.debug(headerKey);
				System.debug(headers.get(headerKey));
				request.setHeader(headerKey, headers.get(headerKey));
			}
		}
		request.setBody(body);
		response = http.send(request);
		//System.debug('HTTP POST Method', response.getBody());
		return response;
	}
	/* public static HttpResponse doPostBlob(String url, Map<String, String> headers, blob body){
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		HttpResponse response;
		request.setEndpoint(url);
		request.setMethod('POST');
		if (headers != null){
			for (String headerKey : headers.keySet()){
				request.setHeader(headerKey, headers.get(headerKey));
			}
		}
		request.setBodyAsBlob(body);
		response = http.send(request);
		return response;
	} */

	public static HttpResponse doPut(String url, Map<String, String> headers, String body){
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		HttpResponse response;
		request.setEndpoint(url);
		request.setMethod('PUT');
		if (headers != null){
			for (String headerKey : headers.keySet()){
				System.debug(headerKey);
				System.debug(headers.get(headerKey));
				request.setHeader(headerKey, headers.get(headerKey));
			}
		}
		request.setBody(body);
		response = http.send(request);
		//System.debug('HTTP PUT Method', response.getBody());
		return response;
	}

	public static HttpResponse doPatch(String url, Map<String, String> headers, String body){
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		HttpResponse response;
		//url += '?_HttpMethod=PATCH';
		request.setEndpoint(url);
		if (headers != null){
			for (String headerKey : headers.keySet()){
				System.debug(headerKey);
				System.debug(headers.get(headerKey));
				request.setHeader(headerKey, headers.get(headerKey));
			}
		}
		
		System.debug(body);
        request.setHeader('Content-Type', 'application/json');
		request.setBody(body);
		request.setMethod('PATCH');
		System.debug('patch request');
		System.debug(request.getHeader('X-HTTP-Method-Override')+request.getBody());
		System.debug('testing patch'+request.getBody());
		response = http.send(request);
		//System.debug('HTTP PATCH Method', response.getBody());
		return response;
	}
}