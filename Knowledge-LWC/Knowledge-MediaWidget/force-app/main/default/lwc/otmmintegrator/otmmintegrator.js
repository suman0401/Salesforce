import { api, LightningElement, track ,wire} from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import { CloseActionScreenEvent } from 'lightning/actions';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import DISPLAY__C from '@salesforce/schema/Knowledge__c.Display__c';

const FEILDS=[DISPLAY__C]
export default class Otmmintegrator extends LightningElement {
        
    @track details = '';
    @api recordId;
    @api assetAmdUrl='';
    @wire(getRecord, { recordId: '$recordId' ,fields:FEILDS})
    account({data,error}){
        if(data){
          this.details=getFieldValue(data,DISPLAY__C);
          this.error=undefined;
        }else{
            this.data=undefined;
            this.details=error;
        }
    }

    handleSubmit(){
    
        this.template.querySelector('lightning-record-edit-form').submit();
       // this.details+=getFieldValue(this.account.data,DISPLAY__C);
        this.template.querySelectorAll('lightning-input-field').forEach(field=>{
            field.reset();
        })
       
    }

    handleEvent(event){
         window.console.log('OTMM Media Widget event handled ', event);

        if (event && event.detail && event.detail.data && event.detail.data.asset && event.detail.data.asset.url ) {
            const assetUrl = event.detail.data.asset.url;
            const assetName = event.detail.data.asset.name;
            if (event.detail.data.eventType == 'link') {
                this.details = this.details + '<p><a href=' + assetUrl + ' target="_blank">' + assetName + '</a></p>';
                this.assetAmdUrl=this.details+assetUrl.data;
            } else if (event.detail.data.eventType == 'import') {
                this.details = this.details + '<img src=' + assetUrl + ' />';
               
            } else {
                console.log('Invalid Event Type....');
            }
        } else {
            console.log('Event doesnt have required asset info..');
        }
       
    }

    handleSuccess(event) {
        const evt = new ShowToastEvent({
            title: 'Image Updated in Record Successfully'+this.assetAmdUrl,
          //  message: 'Record ID: ' + event.details.account,
            variant: 'success',

        });
        this.dispatchEvent(evt);
        this.dispatchEvent(new CloseActionScreenEvent());
       // return refreshApex(this.account);
    }
}