import { LightningElement } from 'lwc';
import getCreatedDateFromAccount from '@salesforce/apex/CreatedDateController.getCreatedDateFromAccount'

export default class CreatedDateANDModifiedDate extends LightningElement {

    accData=[];

    connectedCallback(){
        getCreatedDateFromAccount()
        .then(result=>{
            this.accData =result;
        })
    }
}