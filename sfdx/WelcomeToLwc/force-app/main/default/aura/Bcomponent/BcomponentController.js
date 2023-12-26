({
	FireEvent : function(component, event, helper) {
		var action=component.getEvent("cmpEvent");
        action.setParams({"text":"suman"});
        action.fire();
	}
})