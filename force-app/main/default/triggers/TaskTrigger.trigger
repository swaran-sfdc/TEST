trigger TaskTrigger on Task (after insert) {
    
	for (Task t : Trigger.new) {
        // Check if the Task was created by an EmailMessage
        if (t.TaskSubtype == 'email') {
            // Allow the Task creation if it is related to an EmailMessage
            System.debug('Task created by EmailMessage: ' + t.Subject);
        } else {
            // Block Task creation for any other source
            t.addError('Task creation is only allowed for EmailMessage-related tasks.');
        }
    }
}