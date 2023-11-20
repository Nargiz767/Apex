import { LightningElement, track } from 'lwc';
import chatGPt from '@salesforce/apex/CallOutChatGpt.chatGPt';

export default class ChatGPTComponent extends LightningElement {
    @track userMessage = '';
    @track messages = [];

    handleInputChange(event) {
        this.userMessage = event.target.value;
    }

    async handleSendClick() {
        if (this.userMessage) {
            this.messages.push({ id: this.messages.length, text: this.userMessage });
            this.userMessage = '';

            try {
                const response = await chatGPt({ userMessage: this.userMessage });
                this.messages.push({ id: this.messages.length, text: response });
            } catch (error) {
                console.error('Error fetching ChatGPT response: ', error);
            }
        }
    }
}
