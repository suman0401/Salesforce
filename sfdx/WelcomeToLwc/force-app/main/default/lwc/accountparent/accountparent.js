import { LightningElement } from 'lwc';

export default class Accountparent extends LightningElement {
    searchDetails=[];
    henadledata(event){
        this.searchDetails=[];
     alert('Hi I am detailed send form child to parent');
     console.log(event.detail);
     
     try {
        event.detail.forEach(x => {
            var accData={
            id:x.Id,
            name:x.Name,
            rating:x.Rating
            }
            this.searchDetails.push(accData);
        });
    } catch (error) {
        console.log(error);
    }
}
resetdata(){
    this.searchDetails=[];
}
}