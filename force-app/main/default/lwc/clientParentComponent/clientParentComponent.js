import { LightningElement, wire, track } from 'lwc';

import {
    subscribe,
    unsubscribe,
    APPLICATION_SCOPE,
    MessageContext,
} from 'lightning/messageService';
import productSelectedChannel from '@salesforce/messageChannel/SampleChannel__c';

export default class ClientParentComponent extends LightningElement {

    @wire(MessageContext)  messageContext;
    @track productCode;

    // Encapsulate logic for Lightning message service subscribe and unsubsubscribe
    subscribeToMessageChannel() {
        if (!this.subscription) {
            this.subscription = subscribe(
                this.messageContext,
                productSelectedChannel,
                (message) => this.handleMessage(message),
                { scope: APPLICATION_SCOPE }
            );
        }
    }

    // Standard lifecycle hooks used to subscribe and unsubsubscribe to the message channel
    connectedCallback() {
        console.log('subscribeToMessageChannel started');
        this.subscribeToMessageChannel();
        console.log('subscribeToMessageChannel completed');
    }

    // Handler for message received by component
    handleMessage(message) {
        console.log('handleMessage started');
        this.productCode = message.productCode;
    }
}