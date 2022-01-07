// ASSIGNMENT 1:
// Design a trigger on the Opportunity Object say that when new Opportunity is created, 
// "Next Step" field will populated with the value "Please Contact with Primary Contact."
trigger OpportunityCreatedTrigger on Opportunity (before insert) {
    string nextStep = 'Please Contact with Primary Contact';
    
	for(Opportunity opportunity : trigger.new)
    {
        opportunity.NextStep = nextStep;
    }
}