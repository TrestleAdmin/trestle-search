(()=>{"use strict";var e={n:t=>{var o=t&&t.__esModule?()=>t.default:()=>t;return e.d(o,{a:o}),o},d:(t,o)=>{for(var r in o)e.o(o,r)&&!e.o(t,r)&&Object.defineProperty(t,r,{enumerable:!0,get:o[r]})},o:(e,t)=>Object.prototype.hasOwnProperty.call(e,t)};const t=Trestle;var o=e.n(t);const r=jQuery;var n=e.n(r);o().ready((function(){const e=n()(n()("#search-filters").html());n()('[data-toggle="search-filters"]').popover({html:!0,sanitize:!1,placement:"bottom",container:".search-filters form",animation:!1,template:'\n  <div class="popover search-filters-popover" role="tooltip">\n    <div class="arrow"></div>\n    <div class="popover-body"></div>\n  </div>',content:function(){return o().triggerInit(e),e}})})),n()(document).on("mousedown",(function(e){const t=n()('[data-toggle="search-filters"]'),o=n()(".search-filters-popover");if(o.length){const r=n()(e.target),s=n()(".flatpickr-calendar");r.closest(o).length||r.closest(t).length||r.closest(s).length||t.popover("hide")}}))})();