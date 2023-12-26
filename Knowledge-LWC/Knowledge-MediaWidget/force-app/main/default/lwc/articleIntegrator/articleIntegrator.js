import { api, LightningElement, track,wire } from 'lwc';
import {CloseActionScreenEvent} from 'lightning/actions';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import Content__c from '@salesforce/schema/Article__c.Content__c';

const FEILDS=[Content__c]

export default class ArticleIntegrator extends LightningElement {
    
    @api fieldName=Content__c;
    @api recordId;
    @api contentId='';
    @api objectApiName;
    @api showModal = false;
    // @api backgroundColor='';
    @api assetAmdUrl=[];
    @api iframeurl = "https://micromm.acheron-tech.com/prod/sfdc/mediawidget/microui.html";
    @track details='';
    @track detailsData='';

    @wire(getRecord, { recordId: '$recordId', fields : FEILDS })
    getaccount({error, data}){
         if(data && data!=null){
           this.details = getFieldValue(data, Content__c);
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
    // handleChange(event){
    //     event.preventDefault();
    //     this.details=event.target.value;
    // }
    handleEvent(event){ 
        window.console.log('OTMM Media Widget event handled ', event);
        if (event && event.detail && event.detail.data && event.detail.data.asset && event.detail.data.asset.url) {
            const assetUrl = event.detail.data.asset.url;
            const assetName = event.detail.data.asset.name;
            if (event.detail.data.eventType == 'link') {
                this.details = this.details + '<p><a href=' + assetUrl + ' target="_blank">' + assetName + '</a></p>';
                this.details.push(this.assetAmdUrl);
            } else if (event.detail.data.eventType == 'import') {
               this.details = this.details + '<p><img src=' + assetUrl + ' /></p>';
               this.details.push(this.assetAmdUrl);
            } else {
                console.log('Invalid Event Type....');
            }
        } else {
            console.log('Event doesnt have required asset info..');
        }
    }
    handleSuccess(event) {
        // this.assetAmdUrl=event.details.value;
        const evt = new ShowToastEvent({
            title: 'Successfully Added in  record',
            message: 'Record ID: ' + event.detail.id,
            variant: 'success',
        });
        this.dispatchEvent(evt);
        this.dispatchEvent(new CloseActionScreenEvent());
       
    }
    
}