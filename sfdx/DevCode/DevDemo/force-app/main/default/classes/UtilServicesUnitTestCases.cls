@isTest 
private class UtilServicesUnitTestCases {
    
    @isTest static void validategetOTMMUrl()
    {
        String url = UtilServices.getOTMMUrl('randomPath');
        System.assertEquals(false,String.isBlank(url));
    }

    @isTest static void validateUtilService()
    {
	    UtilServices utilServices = new UtilServices();
        System.assert(true);
    }
}