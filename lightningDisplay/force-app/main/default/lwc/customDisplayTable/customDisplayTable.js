import { LightningElement ,api,wire,track} from 'lwc';
import getAccounts from '@salesforce/apex/ContactsController.getAccounts'
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import { refreshApex } from '@salesforce/apex';
import { updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
// columns
const columns = [
    {
        label: 'Account Name',
        fieldName: 'Name',
        type: 'Name',
        editable: true,
    }, 
	{
        label: 'Product MPM',
        fieldName: 'MPM__c',
        type: 'checkbox',
        editable: true,
    },{
        label: 'Status',
        fieldName: 'S_MPM__c',
        type: 'Picklist',
        editable: true,
    }, {
        label: 'Product FRAMEIO',
        fieldName: 'FrameIO__c',
        type: 'checbox',
        editable: true
    },
	{
        label: 'Status',
        fieldName: 'S_FrameIO__c',
        type: 'Picklist',
        editable: true
    }
];
 
export default class CustomDisplayTable extends LightningElement {
	columns = columns;
    @track accounts;
      Mpm;
    saveDraftValues = [];
 
    @wire(getAccounts)
    accountData(result) {
        this.accounts = result;
        if (result.error) {
            this.accounts = undefined;
        }
    };
    showPopupmodel = false;
    closemodal(){
        this.showPopupmodel = false;
    }
    showPopup(){
        this.showPopupmodel= true;
    }
    @track displayfield='';
    getSelectedName(event) {
        const selectedRows = event.detail.selectedRows;
        // this.displayfield =selectedRows;
        // Display that fieldName of the selected rows
        for (let i = 0; i < selectedRows.length; i++) {
            this.showPopupmodel=true;
            this.displayfield = selectedRows[i].Name+selectedRows[i].MPM__c +selectedRows[i].C_MPM__c+selectedRows[i].S_MPM__c ;

            console.log("selected row length",selectedRows.length,'selected row name',selectedRows[i].Id);
            // alert('You selected: '+i +' row ' + selectedRows[i].name);
        }
    }
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
        await refreshApex(this.accounts);
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