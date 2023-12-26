import { LightningElement } from 'lwc';

export default class Hooksdemo extends LightningElement {
    constructor(){
        super();
        alert('Yes I am From Construction Phase')
    }
    connectedCallback(){
        alert('Yes I am From DOM Insertion Phase')
    }
    renderedCallback(){
        alert('Yes I am from the Render Phase')
    }
    disconnectedCallback(){
        alert('Yes I am From the removal Phase')
    }
}