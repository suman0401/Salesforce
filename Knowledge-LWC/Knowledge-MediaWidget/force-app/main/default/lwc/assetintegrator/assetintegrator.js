import { LightningElement,wire,api } from 'lwc';

export default class Assetintegrator extends LightningElement {
    @api showmodal;
    //  @api asset;
  
      connectedCallback(){
          const that = this;
          window.addEventListener("message", function(event){
              console.log("Message received from origin: " + event.origin);
              console.log(event);
              // const message = event.data;
              // pubsub.fire('simplevt', message );
              that.raiseEvent(event.data);
          });
      }
  
      raiseEvent(data) {
          const customEvent = new CustomEvent('asset', { detail: data })
          this.dispatchEvent(customEvent);
      }
  
      closeModal() {
          this.dispatchEvent(new CustomEvent('closemodal'));
      }
}