import { LightningElement, track } from 'lwc';

export default class ConditionalRenderingTURKISH extends LightningElement {
    areDetailsVisible = false;
    firstname="Nargiz";
@track   location={
    city : "Baku",
    country :"Azerbaijan",
    region : "Europe"

}
    handleChange(event){

        if(event.target.label==="ShowDetails"){
        this.areDetailsVisible= event.target.checked;
    } else if (event.target.label==="firstname"){
        this.firstname= event.target.value
    } else{
  this.location.city=event.target.value
    }
}
}