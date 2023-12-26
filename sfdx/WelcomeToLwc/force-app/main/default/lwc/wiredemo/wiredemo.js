import { LightningElement,track, wire } from 'lwc';
import getData from '@salesforce/apex/AccountSearchWire.getAccount'

export default class Wiredemo extends LightningElement {
@track searchKey = '';
@track accounts;
@track error;
searchAccount(event) {
    this.searchKey = event.target.value;
}
//wire a function
@wire(getData,{actname:'$searchKey'})
wiredAccount({data,error}){
    if(data){
        this.accounts=data;
        this.error=undefined;
   }
    else if(error){
        this.error=error;
        this.data=undefined;
   }
}
}
