import { api, LightningElement } from 'lwc';

export default class DisplayResultSundayPrac extends LightningElement {

    @api results;
    @api error;
    @api columns;
}