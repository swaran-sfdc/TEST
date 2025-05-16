// ------ Codify: AI Generated Code Start-------
 // accountDetails.js
import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
const FIELDS = ['Account.Name', 'Account.Industry', 'Account.Phone'];
export default class AccountDetails extends LightningElement {
    @api accountId;
    account;
    error;
    @wire(getRecord, { recordId: '$accountId', fields: FIELDS })
    wiredAccount({ error, data }) {
        if (data) {
            this.account = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.account = undefined;
        }
    }
}

 //------ Codify: AI Generated Code End-----