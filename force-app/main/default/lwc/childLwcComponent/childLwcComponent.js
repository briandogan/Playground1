import { LightningElement, api, track } from 'lwc';
import {
    subscribe,
    unsubscribe,
    onError,
    setDebugFlag,
    isEmpEnabled,
} from 'lightning/empApi';


export default class ChildLwcComponent extends LightningElement {
    @api productName;
    @api imageSrc;
    @api productPrice;
    @api productCode;
    @track leadId = '';

    channelName = '/event/MyNotificationPE__e';
    isSubscribeDisabled = false;
    isUnsubscribeDisabled = !this.isSubscribeDisabled;

    handleClick(event) { 
        console.log('Payment Button Click');

        var detailObject = {productCode:this.productCode, additionalParam:"TestValue"};
        const buyEventVar = new CustomEvent('buyselected', 
            { detail:detailObject }
        );
        this.dispatchEvent(buyEventVar);
    }

    // Platform Evet Sample
    // Initializes the component
    connectedCallback() {
        this.handleSubscribe();
        // Register error listener
        this.registerErrorListener();
    }

    registerErrorListener() {
        // Invoke onError empApi method
        onError((error) => {
            console.log('Received error from server: ', JSON.stringify(error));
            // Error contains the server-side error
        });
    }

    // Handles subscribe button click
    handleSubscribe() {
        // Callback invoked whenever a new event message is received
        const messageCallback = function (response) {
            console.log('New message received: ', JSON.stringify(response));
            console.log('New message received: ', JSON.parse(response).data.payload.RecordID__c);
            this.leadId = JSON.parse(JSON.stringify(response)).data.payload.RecordID__c;
            console.log('New message received: ', this.leadId);
            // Response contains the payload of the new message received
        };

        // Invoke subscribe method of empApi. Pass reference to messageCallback
        subscribe(this.channelName, -1, messageCallback).then((response) => {
            // Response contains the subscription information on subscribe call
            console.log(
                'Subscription request sent to: ',
                JSON.stringify(response.channel)
            );
            this.subscription = response;
            this.toggleSubscribeButton(true);
        });
    }
}