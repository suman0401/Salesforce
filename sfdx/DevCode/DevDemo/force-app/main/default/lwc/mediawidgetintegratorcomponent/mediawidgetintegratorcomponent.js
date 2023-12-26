import { LightningElement, api } from 'lwc';

export default class Mediawidgetintegratorcomponent extends LightningElement {

    @api mediawidgeturl;

    connectedCallback() {
        const __self = this; 
        window.addEventListener("message", function(event) {
            //console.log("Message received from origin: " + event.origin);
            //console.log(event);

            //validate the origin. Do not raise event if not valid
            if(!__self.mediawidgeturl.includes(event.origin)) {
                return;
            }
            const message = event.data;
            //console.log(message);
            __self.raiseEvent(event.data);
        });
    }

    raiseEvent(data) {
        //console.log("Raising event");
        const customEvent = new CustomEvent('assetdata', { detail: data })
        this.dispatchEvent(customEvent);
    }
}