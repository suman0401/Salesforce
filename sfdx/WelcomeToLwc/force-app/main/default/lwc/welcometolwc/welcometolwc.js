import { LightningElement, track } from 'lwc';

export default class Welcometolwc extends LightningElement {
   @track Display="Suman";

   HandleEvent(event){
       var Display="Test";
       this.Display=event.target.value;
   }
}