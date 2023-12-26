import { api, LightningElement, track,wire } from 'lwc';
import {CloseActionScreenEvent} from 'lightning/actions';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import Display__c from '@salesforce/schema/Knowledge__kav.Display__c';

const FEILDS=[Display__c]

export default class KnowledgeIntegrator extends LightningElement {
    @api fieldName=Display__c;
    @api recordId;
   // @api objectApiName;
    showModal = false;
    iframeurl = "https://micromm.acheron-tech.com/prod/sfdc/mediawidget/microui.html";
    @track details='';
   //@track detailsData='';
    @wire(getRecord, { recordId: '$recordId', fields : FEILDS })
    getaccount({error, data}){
         if(data && data!=null){
           this.details = getFieldValue(data, Display__c);
           if(this.details == null || this.details=='null'){
            this.details='';
           }
           console.log(this.details);
         }else if(error){
            console.log('Data is not getting...');
         }
    }
    linkAsset() {
        this.showModal = true;
    }
    
    closemodal() {
        this.showModal = false;
    }
    handleEvent(event){
        window.console.log('OTMM Media Widget event handled ', event);
        if (event && event.detail && event.detail.data && event.detail.data.asset && event.detail.data.asset.url) {
            const assetUrl = event.detail.data.asset.url;
            const assetName = event.detail.data.asset.name;
            if (event.detail.data.eventType == 'link') {
                this.details = this.details + '<p><a href=' + assetUrl + ' target="_blank">' + assetName + '</a></p>';
            } else if (event.detail.data.eventType == 'import') {
               this.details = this.details + '<p><img src=' + assetUrl + ' /></p>';
            } else {
                console.log('Invalid Event Type....');
            }
        } else {
            console.log('Event doesnt have required asset info..');
        }
    }
    handleSuccess(event) {
        const evt = new ShowToastEvent({
            title: 'Successfully Added in  record',
            message: 'Record ID: ' + event.detail.id,
            variant: 'success',
        });
        this.dispatchEvent(evt);
        this.dispatchEvent(new CloseActionScreenEvent());
    }
}