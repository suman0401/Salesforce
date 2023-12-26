import { LightningElement, track } from 'lwc';

export default class Conditionalrendering extends LightningElement {
    isShow=true;
    isDisplay=false;
    @track accounts=['acheron','HCL','TCS','CTS'];
}