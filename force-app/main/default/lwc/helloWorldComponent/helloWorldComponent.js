import { LightningElement, track, wire } from 'lwc';

import apexMethodNameW from '@salesforce/apex/HelloWorldController2.callApexWire';
import apexMethodNameI from '@salesforce/apex/HelloWorldController2.callApexImperative';


export default class HelloWorldComponent extends LightningElement {
    
    // LWC Controller JS to LWC HTML.
    // @track helps to pass variable value from js to html
    @track bodyText = 'This is the text from Controller --> with @track';
    @track showDetails = false;
    @track bodyTextIMPERATIVE = '';

    errorMessage = '';

    bodyTextNew = 'This is the text from Controller --> WITHOUT @track';
    get bodyTextGet()  { return 'This is the text from Controller --> with GET'; }

    // APEX Controller to LWC Controller with WIRE call
    @wire(apexMethodNameW, {param: 'ParamValue'}) bodyTextWIRE;
    
    // APEX Controller to LWC Controller with IMPERATIVE call
    handleImperativeClick() {
        console.log('step1');
        //apexMethodNameI() without param
        apexMethodNameI({param: 'ParamValue'})
            .then(result => {
                console.log('step2');
                this.bodyTextIMPERATIVE = result;
                console.log(result);
            })
            .catch(error => {
                this.errorMessage = error;
                console.log(error);
            });
    }

    handleClick(event) {
        console.log('BUTTON CLICKED BY USER');
        this.showDetails = !this.showDetails;
    }

    value = [''];
    get options() {
        return [
            { label: 'Show Details', value: 'showdetails' }
        ];
    }

    get selectedValues() {
        return this.value.join(',');
    }

    handleChange(e) {
        this.value = e.detail.value;
        this.showDetails = !this.showDetails;
    }
}