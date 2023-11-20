import { LightningElement, wire } from 'lwc';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import MOBILENUMBER_FIELD from '@salesforce/schema/Contact.MobilePhone';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import DEPARTMENT_FIELD from '@salesforce/schema/Contact.Department';
import { getFieldValue, getRecord } from 'lightning/uiRecordApi';
const fields=[EMAIL_FIELD, FIRSTNAME_FIELD, LASTNAME_FIELD, MOBILENUMBER_FIELD, TITLE_FIELD, DEPARTMENT_FIELD];

export default class GetContactRecordSunday extends LightningElement {
recordId='003Do000002NILrIAO';
contact;

@wire (getRecord, {recordId:'$recordId', fields: fields})
recordHandler({data, error}){
    if (data) {
        console.log('DATA CONTACT====>',data); this.contact=data;


    }

    if (error) {
        console.log(error);
    }


}
    get firstName(){
        return getFieldValue(this.contact, FIRSTNAME_FIELD);
    }

    get lastName(){
        return getFieldValue(this.contact, LASTNAME_FIELD);
    }

    get title(){
        return getFieldValue(this.contact, TITLE_FIELD);
    }
    get email(){
        return getFieldValue(this.contact, EMAIL_FIELD);
    }

    get mobile(){
        return getFieldValue(this.contact, MOBILENUMBER_FIELD);
    }

    get department(){
        return getFieldValue(this.contact, DEPARTMENT_FIELD);
    }
}