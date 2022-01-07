trigger leadTrigger on Lead (after update) {
    
    List<MyNotificationPE__e> notificationEvents = new List<MyNotificationPE__e>();
    for(Lead ld : trigger.New)
    {
        if(ld.LeadSource== 'Phone Inquiry' && ld.Status == 'Working - Contacted')
        {
            // Fire Platform Event MyNotificationPE            
			notificationEvents.add(new MyNotificationPE__e(RecordId__c=ld.ID));
        }
    }
	// Call method to publish events
	List<Database.SaveResult> results = EventBus.publish(notificationEvents);
}