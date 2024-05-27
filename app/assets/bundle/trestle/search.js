(()=>{"use strict";const e=class extends Trestle.Controllers.popover{initialize(){super.initialize(),this.boundPersistFormState=this.persistFormState.bind(this)}connect(){super.connect(),this.element.addEventListener("hide.bs.popover",this.boundPersistFormState)}disconnect(){super.disconnect(),this.element.removeEventListener("hide.bs.popover",this.boundPersistFormState)}get popoverOptions(){return{...super.popoverOptions,customClass:"search-filters-popover",animation:!1,html:!0,sanitize:!1,placement:"bottom",container:this.container,content:()=>this.content}}clickWithinPopover(e){return super.clickWithinPopover(e)||this.clickWithinCalendar(e)}clickWithinCalendar(e){return!!e.target.closest(".flatpickr-calendar")}get container(){return document.querySelector(".search-filters form")}get content(){return this.contentFragment||(this.contentFragment=document.createRange().createContextualFragment(this.contentTemplate.innerHTML)),this.contentFragment}get contentTemplate(){return document.getElementById("search-filters")}persistFormState(e){if(this.popover.tip){const e=this.popover.tip.querySelector(".popover-body"),t=new DocumentFragment;t.append(...e.childNodes),this.contentFragment=t}}};Stimulus.register("search-filters",e)})();