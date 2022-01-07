import { LightningElement } from 'lwc';

export default class ChildLifeCycleComponent extends LightningElement {
    constructor() { 
        super();
        console.log('CHILD: I AM IN CONSTRUCTOR');
    }

    connectedCallback() { 
        console.log('CHILD: I AM IN CONNECTED CALLBACK');
    }

    disconnectedCallback() { 
        console.log('CHILD: I AM IN DISCONNECTED CALLBACK');
    }

    renderedCallback() { 
        console.log('CHILD: I AM IN RENDER CALLBACK');
    }
}