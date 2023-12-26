@isTest 
private class MyCanvasLifecycleHandlerTestCases {
    @isTest static void check() {
        MyCanvasLifecycleHandler handler = new MyCanvasLifecycleHandler();
        handler.excludeContextTypes();
        System.assert(true);
    }

    @isTest static void testDefaultMockValues() {
        MyCanvasLifecycleHandler handler = new MyCanvasLifecycleHandler();
        Canvas.Test.testCanvasLifecycle(handler,null);
        
    }

    @isTest static void testOverriddenEnvironmentValues() {
        // Test handler with some mock environment context values
        Map<String,String> envValues = new Map<String,String>();
        envValues.put(Canvas.Test.KEY_DISPLAY_LOCATION,'Chatter');
        envValues.put(Canvas.Test.KEY_LOCATION_URL,
            'https://acheronsoftwareconsultancy3-dev-ed.my.salesforce.com/_ui/core/chatter/ui/ChatterPage');
        MyCanvasLifecycleHandler handler = new MyCanvasLifecycleHandler();
        Canvas.RenderContext mock = Canvas.Test.mockRenderContext(null,envValues);
        // Directly update the mock RenderContext and set the custom parameters
        mock.getEnvironmentContext().setParametersAsJSON(
            '{\"one\":1,\"two\":2,\"bool\":true,\"stringVal\":\"some string\"}');
        Canvas.Test.testCanvasLifecycle(handler,mock);
    }
}