import { LightningElement } from 'lwc';
import  seachbyPostalCode from '@salesforce/apex/StudentCtrlSundayPrac.seachbyPostalCode'
const COLUMNS = [
    {label: "Student Name", fieldName: "Student_Name__c", type: "text"},
    {label: "Class", fieldName: "Class__c", type: "number"},
    {label: "Mobile", fieldName: "Mobile__c", type: "tel"},
    {label: "Email", fieldName: "Email__c", type: "email"},
    {label: "Postal Code", fieldName: "Postal_Code__c", type: "text"}
];
export default class DisplayResultParent extends LightningElement {
SearchWord;
students;
columns=COLUMNS;
changeHandler(event){
    this.SearchWord=event.target.value;
    console.log(this.SearchWord)
    seachbyPostalCode({code:this.SearchWord}).then(result=>{
        console.log(result);
        this.students=result;
    })

    
}
}