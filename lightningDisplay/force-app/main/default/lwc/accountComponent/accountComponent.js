import { LightningElement ,api,track} from 'lwc';

export default class AccountComponent extends LightningElement {
    @api recordId;
    @api objectApiName;
    @track objRecordId;
    handleMouseover(event) {
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