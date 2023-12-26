import { LightningElement,api,track ,wire} from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import {CloseActionScreenEvent} from 'lightning/actions';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import S_MPM__c from '@salesforce/schema/Account.S_MPM__c';
import C_MPM__c from'@salesforce/schema/Account.C_MPM__c';
const FEILDS=[S_MPM__c,C_MPM__c]
export default class PopoverComponent extends LightningElement {
    @api listViewids;
    disabled=false;
    @api recordId;
    @api objectApiName;
    @track details='';
    @api showModal = false;
    fields = ['AccountId', 'Name', 'Title', 'S_MPM__c', 'C_MPM__c'];
    handleSubmit(){
    
        this.template.querySelector('lightning-record-edit-form').submit();
       // this.details+=getFieldValue(this.account.data,DISPLAY__C);
        this.template.querySelectorAll('lightning-input-field').forEach(field=>{
            field.reset();
        })
       
    }
    /*@wire(getRecord, { recordId: '$recordId', fields : FEILDS , modes: 'Edit'})
    getaccount;
    get status(){
        return getFieldValue(this.getaccount.data,S_MPM__c)
    }
    get Comments(){
        return getFieldValue(this.getaccount.data,C_MPM__c);
    }
    
    handleChange(event) {
        // Display field-level errors and disable button if a name field is empty.
       if (!event.target.value) {
           event.target.reportValidity();
           this.disabled = true;
       }
       else {
           this.disabled = false;
       }
   }

    closemodal() {
        this.showModal = false;
    }

    handlesuccess(event){
        const evt = new ShowToastEvent({
            title: 'Successfully Added in  record',
            message: 'Record ID: ' + event.detail.id,
            variant: 'success',
        });
        this.dispatchEvent(evt);
        this.dispatchEvent(new CloseActionScreenEvent());
    }*/
    connectedCallback(){
        console.log("created")
      this.showModal=true;
    }
    disconnectedCallback(){
        console.log('Destroyed')
        window.close();
        this.showModal=false;
    }
    closemodal() {
        this.showModal = false;
    }
}