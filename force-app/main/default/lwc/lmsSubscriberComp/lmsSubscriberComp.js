import { APPLICATION_SCOPE, MessageContext, subscribe } from 'lightning/messageService';
import { LightningElement, wire } from 'lwc';
import SI_MC from '@salesforce/messageChannel/SoftInnovas__c';

export default class LmsSubscriberComp extends LightningElement {
    messageReceived;

    @wire(MessageContext)
    context;

    connectedCallback (){
        this.subscribeHandler();
    }

    subscribeHandler(){
        subscribe(
        this.context,
        SI_MC ,
        (message)=>{this.messageReceived=message},
        {scope:APPLICATION_SCOPE}
        );
    }
    }
