import { LightningElement, wire, track } from 'lwc';
import getAllUser from '@salesforce/apex/GoRestComponentController.getAllUser';
import createNewUser from '@salesforce/apex/GoRestComponentController.createNewUser';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class GoRestComponent extends LightningElement {

    @track allUsers;
    @track email;
    //@wire(getAllUser) allUsers;

    @wire(getAllUser)
    wireduser({ error, data }) {
        if (data) {
            //Handle Data
            this.allUsers = JSON.parse(data);
            console.log('this.allUsers', JSON.parse(JSON.stringify(this.allUsers)));
        } else {
            //Handle Exception
            console.log('Error', error);
        }
    }

    handleEmailInput(event) { 
        console.log('Value', event.target.value);
        this.email = event.target.value;
    }

    handleSave(event) { 
        //TODO: Handle Save
        createNewUser({email: this.email})
            .then(result => {
                console.log(JSON.parse(JSON.stringify(result)));
                this.showToast('SUCCESS', 'New user Created', 'success');
            })
            .catch(error => {
                console.log(JSON.stringify(error), error);
                this.showToast('FAILED', '', 'error');
            }
        );
    }

    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        });
        this.dispatchEvent(event);
    }
}