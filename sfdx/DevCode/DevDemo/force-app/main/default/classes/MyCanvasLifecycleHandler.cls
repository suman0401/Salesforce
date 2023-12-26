public class MyCanvasLifecycleHandler 
implements Canvas.CanvasLifecycleHandler {

    public Set<Canvas.ContextTypeEnum> excludeContextTypes(){
        Set<Canvas.ContextTypeEnum> excluded = new Set<Canvas.ContextTypeEnum>();

        // Code goes here to add items to excluded list
        // that should be excluded from Context data

        return excluded;
    }

   public void onRender(Canvas.RenderContext renderContext) {
	 System.debug('Canvas lifecycle called.');
    // Get the Application and Environment context from the RenderContext
    Canvas.ApplicationContext app = renderContext.getApplicationContext();
    Canvas.EnvironmentContext env = renderContext.getEnvironmentContext();
	System.debug('canvas url'+app.getCanvasUrl());
    // Check the application version
    /*Double currentVersion = Double.valueOf(app.getVersion());
    if (currentVersion <= 5){
        // Versions lower than 5 are no longer supported in this example
        throw new Canvas.CanvasRenderException('Error: Versions earlier than 5 are no longer supported.');
    }*/
       
     System.debug(app.getCanvasUrl());
     String appUrl = app.getCanvasUrl();
     Integer uriStartIdx = appUrl.indexOf('/prod');
     String uriPath = appUrl.substring(uriStartIdx);
     String path = '';
      
     System.debug('uri path is: '+uriPath);
       
     System.debug('params received: '+env.getParametersAsJSON());
       
     // Retrieve parameters from the page
     Map<String, Object> params = (Map<String, Object>) JSON.deserializeUntyped(env.getParametersAsJSON());
     if(params != null && !params.isEmpty()){
       path = String.valueOf((String) params.get('path'));    
     }
     else {
     	throw new Canvas.CanvasRenderException('Error: No parameters found from the app page. Kindly contact administrator');
     }
    
    System.debug('path parameter value: '+ path);
       
       
    // Override app URL, replacing portion after domain with '/alternatePath'
    app.setCanvasUrlPath(uriPath + path);
	System.debug(app.getCanvasUrl());
    
	}
}