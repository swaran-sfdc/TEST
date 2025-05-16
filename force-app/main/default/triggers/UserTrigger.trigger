trigger UserTrigger on User (before insert,before update,after insert,after update) {
	UserTriggerHandler handlerInstance = new UserTriggerHandler();
    if(Trigger.isBefore && Trigger.isInsert){
        handlerInstance.onBeforeInsert(Trigger.new);
    }
    
    if(Trigger.isAfter && Trigger.isInsert){
        handlerInstance.onAfterInsert(Trigger.new);
    }
}