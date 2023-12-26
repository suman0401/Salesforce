import { LightningElement ,wire,track ,api} from 'lwc';
import getContacts from '@salesforce/apex/ContactsController.getContacts';
import { updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
// columns
const columns = [
    {
        label: 'Name',
        fieldName: 'Name',
        type: 'text',
    }, {
        label: 'FirstName',
        fieldName: 'FirstName',
        type: 'text',
        editable: true,
    }, {
        label: 'LastName',
        fieldName: 'LastName',
        type: 'text',
        editable: true,
    }, {
        label: 'Phone',
        fieldName: 'Phone',
        type: 'phone',
        editable: true
    }
];
export default class ContactDisplayTable extends LightningElement {
    @api recordId;
    columns = columns;
    @track contacts;
    saveDraftValues = [];
 
    @wire(getContacts)
    contactData(result) {
        this.contacts = result;
        if (result.error) {
            this.contacts = undefined;
        }
    };
 
    handleSave(event) {
        this.saveDraftValues = event.detail.draftValues;
        const recordInputs = this.saveDraftValues.slice().map(draft => {
            const fields = Object.assign({}, draft);
            return { fields };
        });
 
        // Updateing the records using the UiRecordAPi
        const promises = recordInputs.map(recordInput => updateRecord(recordInput));
        Promise.all(promises).then(res => {
            this.ShowToast('Success', 'Records Updated Successfully!', 'success', 'dismissable');
            this.saveDraftValues = [];
            return this.refresh();
        }).catch(error => {
            this.ShowToast('Error', 'An Error Occured!!', 'error', 'dismissable');
        }).finally(() => {
            this.saveDraftValues = [];
        });
    }
 
    ShowToast(title, message, variant, mode){
        const evt = new ShowToastEvent({
                title: title,
                message:message,
                variant: variant,
                mode: mode
            });
            this.dispatchEvent(evt);
    }
 
    // This function is used to refresh the table once data updated
    async refresh() {
        await refreshApex(this.contacts);
    }

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