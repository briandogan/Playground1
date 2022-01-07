import { LightningElement, api } from 'lwc';

export default class PaymentComponent extends LightningElement {
    @api productName;
    @api productCode;
}