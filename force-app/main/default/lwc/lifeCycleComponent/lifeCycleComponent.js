import { LightningElement, track } from 'lwc';

export default class LifeCycleComponent extends LightningElement {
    @track selectedIndex = 0;
    @track showChild = false;

    constructor() { 
        super();
        console.log('PARENT: I AM IN CONSTRUCTOR');
    }

    connectedCallback() { 
        console.log('PARENT: I AM IN CONNECTED CALLBACK');
    }

    disconnectedCallback() { 
        console.log('PARENT: I AM IN DISCONNECTED CALLBACK');
    }

    renderedCallback() { 
        console.log('PARENT: I AM IN RENDER CALLBACK');
    }
    handleClick(event) { 
        this.selectedIndex = this.selectedIndex + 1;
    }

    handleView() { 
        console.log('PARENT: I AM IN HANDLE VIEW');
        this.showChild = !this.showChild;
    }
}