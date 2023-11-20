import getMatchingContact from '@salesforce/apex/ContactLWCClass.getMatchingContact';

import { LightningElement } from 'lwc';

const COLUMNS= [
    {label : "First Name",fieldName:"FirstName",type:"text"},
    {label : "Last Name",fieldName:"LastName",type:"text"},
    {label : "Title",fieldName:"Title",type:"text"},
    {label : "Department",fieldName:"Department",type:"text"}
]


export default class SearchComponent extends LightningElement {
 contacts;
 columns= COLUMNS;
 error;

 changeHandler(event){
    const searchWord= event.target.value;

    if(searchWord.length===0){
        this.contacts=undefined;
        this.error=undefined;
    } else {
        getMatchingContact({searchKey: searchWord })
           .then(results=>{

            if(results.length==0){
                this.contacts=undefined;
                this.error="Please use some other criteria"
            } else {
                this.contacts=results;
                this.error=undefined;
            }
           })
           .catch(error=>{
this.error= error.body.message;
this.contacts= undefined;
           })
    }
 }
}