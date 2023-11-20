import { api, LightningElement } from 'lwc';

export default class DisplayResults extends LightningElement {
  @api  results;
   @api  columns;
    @api error;
}