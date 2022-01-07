import { LightningElement, track, wire } from 'lwc';
 
import { publish, MessageContext } from 'lightning/messageService';
import productSelectedChannel from '@salesforce/messageChannel/SampleChannel__c';

export default class ParentLwcComponent extends LightningElement {
    productDetails = [
        {
            code: 1234,
            name: "Virat Kohli Basket Classic Unisex Sneakers",
            image: "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/375314/02/sv01/fnd/IND/fmt/png/one8-Virat-Kohli-Basket-Classic-Unisex-Sneakers",
            price: 49.99
        },
        {
            code: 2345,
            name: "Caracal SoftFoam+ Sneakers",
            image: "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/369863/07/sv01/fnd/IND/fmt/png/Caracal-SoftFoam+-Sneakers",
            price: 79.49
        },
        {
            code: 3456,
            name: "PUMA Claw Men's Shoes",
            image: "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/381367/02/sv01/fnd/IND/fmt/png/PUMA-Claw-Men's-Shoes",
            price: 69.49
        },
    ];
    

    @wire(MessageContext) messageContext;

    @track selectedIndex = 0;
    @track selectedProduct = this.productDetails[this.selectedIndex].name;
    @track selectedImage = this.productDetails[this.selectedIndex].image;
    @track price = this.productDetails[this.selectedIndex].price;
    @track selectedProductCode = this.productDetails[this.selectedIndex].code;

    showPayment = false;

    handleClick(event) { 
        this.selectedIndex = this.selectedIndex + 1;
        if (this.selectedIndex == 3) { 
            this.selectedIndex = 0;
        }
       this.selectedProduct = this.productDetails[this.selectedIndex].name;
       this.selectedImage = this.productDetails[this.selectedIndex].image;
       this.price = this.productDetails[this.selectedIndex].price;
       this.selectedProductCode = this.productDetails[this.selectedIndex].code;

       // Pubish message via Lightning Message Service
       const payload = { productCode: this.selectedProductCode };
       console.log("Publish Message Started: ", payload);
       publish(this.messageContext, productSelectedChannel, payload);
       console.log("Publish Message Completed: ", payload);
    }

    handleSelectedProduct(event)
    {
        const detailObject = event.detail;
        const prdCode = detailObject.productCode;
        const additionalPrm = detailObject.additionalParam;
        console.log("Product Selected: ", prdCode, " Additional Param: ", additionalPrm);
        this.showPayment=true;
    }
}


// SFDX: Create project with manifest  -> Standard -> Write Project Name -> Select Location ->