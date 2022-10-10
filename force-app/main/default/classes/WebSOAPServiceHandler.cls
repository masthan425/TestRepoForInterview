public class WebSOAPServiceHandler {    
    
	public static String SOAP_END_URI = 'http://soap.sforce.com/2006/04/metadata';
     public String endpointURI = URL.getSalesforceBaseUrl().toExternalForm() + '/services/Soap/m/42.0';
    public WebSOAPServiceResponse.AsyncResult PackageRetrieve(WebSOAPServiceRequest retrieveRequest){
        WebSOAPServiceHandler.RetrieveMetadataElement request = new WebSOAPServiceHandler.RetrieveMetadataElement();
            request.retrieveRequest = retrieveRequest;
            WebSOAPServiceResponse response;
            Map<String, WebSOAPServiceResponse> responseMap = new Map<String, WebSOAPServiceResponse>();
            responseMap.put('response', response);
            WebServiceCallout.invoke(
              this,
              request,
              responseMap,
              new String[]{endpointURI,
              '',
              SOAP_END_URI,
              'retrieve',
              SOAP_END_URI,
              'retrieveResponse',
              'WebSOAPServiceResponse'}
            );
            response = responseMap.get('response');
            return response.result;
        }
   

        public class RetrieveMetadataElement {
        public WebSOAPServiceRequest retrieveRequest;
        private String[] retrieveRequestTypeInfo = new String[]{'retrieveRequest',SOAP_END_URI,null,'1','1','false'};
        private String[] apex_schemaTypeInfo = new String[]{SOAP_END_URI,'true','false'};
        private String[] field_orderTypeInfo = new String[]{'retrieveRequest'};
    	}
}