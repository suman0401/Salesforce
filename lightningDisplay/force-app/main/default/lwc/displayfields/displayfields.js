import { LightningElement,api ,track} from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import STATUS_FIELD from '@salesforce/schema/Account.S_MPM__c';

export default class Displayfields extends LightningElement {
    nameField = NAME_FIELD;
    statusField=STATUS_FIELD;
    @track objRecordId;
        // Flexipage provides recordId and objectApiName
        @api recordId;
        @api objectApiName;
        handleMouseover(event){
            console.log('hii from mouseover');
            console.log(this.recordId);
            this.objRecordId = null
            const toolTipDiv = this.template.querySelector('div.ModelTooltip');
            toolTipDiv.style.opacity = 1;
            toolTipDiv.style.display = "block";
            // eslint-disable-next-line
            window.clearTimeout(this.delayTimeout);
            // eslint-disable-next-line @lwc/lwc/no-async-operation
            this.delayTimeout = setTimeout(() => {
                this.objRecordId = this.recordId;
            }, 50);
        }
         /* Handle Mouse Out*/
    handleMouseout() {
        const toolTipDiv = this.template.querySelector('div.ModelTooltip');
        toolTipDiv.style.opacity = 0;
        toolTipDiv.style.display = "none";
    }
}