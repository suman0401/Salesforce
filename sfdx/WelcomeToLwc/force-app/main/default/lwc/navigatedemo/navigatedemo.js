import { LightningElement } from 'lwc';
import { NavigationMixin} from 'lightning/navigation'

export default class Navigatedemo extends NavigationMixin(LightningElement) {
    openAccountHome(){
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes:{
                objectApiName:'Account',
                actionName:'home'
            }
 
        });
    }
    openAccountNew(){
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes:{
                objectApiName:'Account',
                actionName:'new'
            }
 
        });
    }
    openAccountList(){
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes:{
                objectApiName:'Account',
                actionName:'list'
            }
 
        });
    }
    openAccountRecord(){
        this[NavigationMixin.Navigate]({
            type:'standard__recordPage',
            attributes:{
                recordId:'0015j00000anEjEAAU',
                actionName:'view'
            }
 
        });
    }
    openMerchandiseHome(){
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes:{
                objectApiName:'Merchandise__c',
                actionName:'home'
            }
 
        });
    }
    openMerchandiseNew(){
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes:{
                objectApiName:'Merchandise__c',
                actionName:'new'
            }
 
        });
    }
    openMerchandiseList(){
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes:{
                objectApiName:'Merchandise__c',
                actionName:'list'
            }
 
        });
    }
    openMerchandiseRecord(){
        this[NavigationMixin.Navigate]({
            type:'standard__recordPage',
            attributes:{
                recordId:'a025j000006yinhAAA',
                actionName:'view'
            }
 
        });
    }
    openExternalUrl(){
        this[NavigationMixin.Navigate]({
            type:'standard__webPage',
            attributes:{
                url:'https://www.google.co.in/'
            }
        })
    }
}