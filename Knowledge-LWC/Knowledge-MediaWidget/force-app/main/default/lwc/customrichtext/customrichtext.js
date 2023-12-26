import { LightningElement,api,track } from 'lwc';

export default class Customrichtext extends LightningElement {
    // showModal = false;
    // myVal = '<strong>Hello!</strong>';
    // clickchange(event) {
    //     this.myVal = event.target.value;
    //     this.showModal = true;
    // }
    // handleCodeBlockButtonClick() {
    //     const inputRichText = this.template.querySelector('lightning-input-rich-text');
    //     let format = inputRichText.getFormat();

    //     // Set or unset code-block format based on format on current selection
    //     if (format['code-block']) {
    //         inputRichText.setFormat({ 'code-block': false });
    //     } else {
    //         inputRichText.setFormat({ 'code-block': true });
    //     }
        
    preventCloseOnClickOut = false;
    @api AssetAmdUrl=[];
    @api iframeurl = "https://micromm.acheron-tech.com/prod/sfdc/mediawidget/microui.html";
    @track details='';
    @api showModal = false;

    openPopup(event) {
        event.target.showPopup();
       // this.showModal = true;
    }

    closePopup() {
        this.template
            .querySelectorAll('lightning-rich-text-toolbar-button')[0].submit()
            .closePopup();
    }
    linkAsset() {
        this.showModal = true;
    }
    
    closemodal() {
        this.showModal = false;
    }
    handleChange(event){
        this.details=event.target.value;
    }
    handleSave() {
        const name = this.template.querySelector('lightning-input');
        this.enteredText = name.value;
        // save the content
        this.closePopup();
    }

    handlePopupClickout(event) {
        window.console.log('OTMM Media Widget event handled ', event);
        if (event && event.detail && event.detail.data && event.detail.data.asset && event.detail.data.asset.url) {
            const assetUrl = event.detail.data.asset.url;
            const assetName = event.detail.data.asset.name;
            if (event.detail.data.eventType == 'link') {
                this.details = this.details + '<p><a href=' + assetUrl + ' target="_blank">' + assetName + '</a></p>';
                console.log('details is ->'+this.details)
               this.details.push(...this.assetAmdUrl);
               console.log(this.AssetAmdUrl);


            } else if (event.detail.data.eventType == 'import') {
               this.details = this.details + '<p><img src=' + assetUrl + ' /></p>';
               this.details.push(...this.assetAmdUrl);
               console.log(this.AssetAmdUrl);

            } else {
                console.log('Invalid Event Type....');
            }
        } else {
            console.log('Event doesnt have required asset info..');
        }
        
    }
  

}