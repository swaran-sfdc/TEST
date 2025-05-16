public with sharing class EmailMessageController {
    public EmailMessageController() {

    }

    @AuraEnabled
    public static String  createEmailMessage(){
        String returnMessage = 'Success';
        try {
            EmailMessage emailMessage = new EmailMessage();

        // Set the required fields
        emailMessage.Subject = 'Test Email Subject';
        emailMessage.TextBody = 'This is the body of the test email.';
        emailMessage.FromAddress = 'sender@example.com';
        emailMessage.ToAddress = 'recipient@example.com';
        emailMessage.Status = '2'; // 2 corresponds to 'Received'
        emailMessage.MessageDate = DateTime.now();

        // Optionally, set other fields
        emailMessage.HtmlBody = '<p>This is the HTML body of the test email.</p>';
        insert emailMessage;


        System.debug('EmailMessage inserted successfully: ' + emailMessage.Id);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return returnMessage;
    }
}