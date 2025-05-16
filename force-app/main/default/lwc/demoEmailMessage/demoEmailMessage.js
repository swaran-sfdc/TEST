import { LightningElement } from 'lwc';
import createEmailMessage from '@salesforce/apex/EmailMessageController.createEmailMessage';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class DemoEmailMessage extends LightningElement {
    receiverId = '';
    subject = '';
    body = '';

    // Method to handle input changes
    handleInputChange(event) {
        const field = event.target.dataset.id;
        if (field === 'receiverId') {
            this.receiverId = event.target.value;
        } else if (field === 'subject') {
            this.subject = event.target.value;
        } else if (field === 'body') {
            this.body = event.target.value;
        }
    }

    // Method to handle form submission
    handleCreateEmail() {
        // Call Apex method to create email
        createEmailMessage()
            .then(result => {
                // Show success *
                this.showToast('Success', 'Email created successfully', 'success');

                // Reset input fields
                this.receiverId = '';
                this.subject = '';
                this.body = '';
            })
            .catch(error => {
                // Show error *
                this.showToast('Error', 'Failed to create email', 'error');
                console.error('Error creating email:', error);
            });
    }

    // Method to show * messages
    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
        });
        this.dispatchEvent(event);
    }
}