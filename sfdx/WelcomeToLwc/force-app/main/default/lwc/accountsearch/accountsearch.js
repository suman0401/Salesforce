import { LightningElement, track } from 'lwc';
import getAccountData from'@salesforce/apex/AccountSearch.getAccount';

export default class Accountsearch extends LightningElement {
    @track accountname;
    @track accountphone;
    @track billingstreet;
    @track billingcity;
    @track billingstate;
    @track billingzipcode;
empty=[];
    handleEvent(event){
      if(event.target.name=='accountname'){
          this.accountname=event.target.value;
          console.log(this.accountname);
      }
      else if(event.target.name=='accountphone'){
            this.accountphone=event.target.value;
            console.log(this.accountphone);
      }
    }
    handleEventStreet(event){
        if(event.target.name=='billingstreet'){
            this.billingstreet=event.target.value;
            console.log(this.billingstreet);
        }
        else if(event.target.name=='billingcity'){
              this.billingcity=event.target.value;
              console.log(this.billingcity);
        }
        else if(event.target.name=='billingstate'){
            this.billingstate=event.target.value;
            console.log(this.billingstate);
      }
        else if(event.target.name=='billingzipcode'){
          this.billingzipcode=event.target.value;
           console.log(this.billingzipcode);
  }
      }
      accountsearch(){
       alert(this.accountname);
       getAccountData({actname:this.accountname,
        actphone:this.accountphone,
        actbillingstate:this.billingstate,
        billingcity:this.billingcity,
        billingzipcode:this.billingzipcode}).then(
           result=>{console.log(result);
            this.dispatchEvent(new CustomEvent('abc',{detail:result}))
            
        }).cache(error=>{
           console.log(error);
       })
      }
      Resetaccount(){
          this.accountname='';
          this.accountphone='';
          this.billingcity='';
          this.billingstate='';
          this.billingstreet='';
          this.billingzipcode='';
        getAccountData({actname:this.accountname,
            actphone:this.accountphone,
            actbillingstate:this.billingstate,
            billingcity:this.billingcity,
            billingzipcode:this.billingzipcode}).then(
        this.dispatchEvent(new CustomEvent('xyz'))
        ).cache(error=>{
            console.log(error);
        })
      }
}