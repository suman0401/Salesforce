import { LightningElement ,api} from 'lwc';
const columns = [
    { label: 'Account Id', fieldName: 'id' },
    { label: 'Account Name', fieldName: 'name' },
    { label: 'Rating',fieldName:'rating',type:'picklist'}
   
];
export default class Searchresult extends LightningElement {
    columns=columns;
    @api totalresult=[];
}