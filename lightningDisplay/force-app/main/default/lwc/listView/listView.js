import { LightningElement,api } from 'lwc';

export default class ListView extends LightningElement {
	@api listViewIds=[];
    close(){
		setTimeout(
			function() {
				window.history.back();
			},
			1000
		);
	}
}
