({
	myAction : function(component, event, helper) {
        var action = component.get("c.getContacts");
        action.setCallback(this, function(response){
            var state = response.getState();//SUCCESS, ERROR, and INCOMPLETE
            if (state === "SUCCESS") {
                var responseObj = response.getReturnValue();
                console.log('responseObj', responseObj);
                console.log('responseObjItem', responseObj[0]);

                component.set("v.parentVar", responseObj[0].Name);
            }
        });
        $A.enqueueAction(action);//Comeback to the Controller.
	}
})