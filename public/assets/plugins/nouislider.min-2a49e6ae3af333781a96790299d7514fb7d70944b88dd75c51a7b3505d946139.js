!function(t){"function"==typeof define&&define.amd?define([],t):"object"==typeof exports?module.exports=t():window.noUiSlider=t()}(function(){"use strict";function e(t){return"object"==typeof t&&"function"==typeof t.to&&"function"==typeof t.from}function ut(t){t.parentElement.removeChild(t)}function ct(t){t.preventDefault()}function pt(t){return t.filter(function(t){return!this[t]&&(this[t]=!0)},{})}function a(t,e){return Math.round(t/e)*e}function ft(t,e){var r=t.getBoundingClientRect(),n=t.ownerDocument,i=n.documentElement,o=St(n);return/webkit.*Chrome.*Mobile/i.test(navigator.userAgent)&&(o.x=0),e?r.top+o.y-i.clientTop:r.left+o.x-i.clientLeft}function i(t){return"number"==typeof t&&!isNaN(t)&&isFinite(t)}function dt(t,e,r){0<r&&(gt(t,e),setTimeout(function(){vt(t,e)},r))}function ht(t){return Math.max(Math.min(t,100),0)}function mt(t){return Array.isArray(t)?t:[t]}function r(t){var e=(t=String(t)).split(".");return 1<e.length?e[1].length:0}function gt(t,e){t.classList?t.classList.add(e):t.className+=" "+e}function vt(t,e){t.classList?t.classList.remove(e):t.className=t.className.replace(new RegExp("(^|\\b)"+e.split(" ").join("|")+"(\\b|$)","gi")," ")}function bt(t,e){return t.classList?t.classList.contains(e):new RegExp("\\b"+e+"\\b").test(t.className)}function St(t){var e=void 0!==window.pageXOffset,r="CSS1Compat"===(t.compatMode||"");return{x:e?window.pageXOffset:r?t.documentElement.scrollLeft:t.body.scrollLeft,y:e?window.pageYOffset:r?t.documentElement.scrollTop:t.body.scrollTop}}function wt(){return window.navigator.pointerEnabled?{start:"pointerdown",move:"pointermove",end:"pointerup"}:window.navigator.msPointerEnabled?{start:"MSPointerDown",move:"MSPointerMove",end:"MSPointerUp"}:{start:"mousedown touchstart",move:"mousemove touchmove",end:"mouseup touchend"}}function xt(){var t=!1;try{var e=Object.defineProperty({},"passive",{get:function(){t=!0}});window.addEventListener("test",null,e)}catch(ct){}return t}function yt(){return window.CSS&&CSS.supports&&CSS.supports("touch-action","none")}function l(t,e){return 100/(e-t)}function s(t,e){return 100*e/(t[1]-t[0])}function u(t,e){return s(t,t[0]<0?e+Math.abs(t[0]):e-t[0])}function o(t,e){return e*(t[1]-t[0])/100+t[0]}function c(t,e){for(var r=1;t>=e[r];)r+=1;return r}function n(t,e,r){if(r>=t.slice(-1)[0])return 100;var n,i,o,s,a=c(r,t);return n=t[a-1],i=t[a],o=e[a-1],s=e[a],o+u([n,i],r)/l(o,s)}function p(t,e,r){if(100<=r)return t.slice(-1)[0];var n,i=c(r,e);return o([t[i-1],t[i]],(r-(n=e[i-1]))*l(n,e[i]))}function f(t,e,r,n){if(100===n)return n;var i,o,s=c(n,t);return r?(i=t[s-1],((o=t[s])-i)/2<n-i?o:i):e[s-1]?t[s-1]+a(n-t[s-1],e[s-1]):n}function d(t,e,r){var n;if("number"==typeof e&&(e=[e]),"[object Array]"!==Object.prototype.toString.call(e))throw new Error("noUiSlider ("+Ct+"): 'range' contains invalid value.");if(!i(n="min"===t?0:"max"===t?100:parseFloat(t))||!i(e[0]))throw new Error("noUiSlider ("+Ct+"): 'range' value isn't numeric.");r.xPct.push(n),r.xVal.push(e[0]),n?r.xSteps.push(!isNaN(e[1])&&e[1]):isNaN(e[1])||(r.xSteps[0]=e[1]),r.xHighestCompleteStep.push(0)}function h(t,e,r){if(!e)return!0;r.xSteps[t]=s([r.xVal[t],r.xVal[t+1]],e)/l(r.xPct[t],r.xPct[t+1]);var n=(r.xVal[t+1]-r.xVal[t])/r.xNumSteps[t],i=Math.ceil(Number(n.toFixed(3))-1),o=r.xVal[t]+r.xNumSteps[t]*i;r.xHighestCompleteStep[t]=o}function m(t,e,r){this.xPct=[],this.xVal=[],this.xSteps=[r||!1],this.xNumSteps=[!1],this.xHighestCompleteStep=[],this.snap=e;var n,i=[];for(n in t)t.hasOwnProperty(n)&&i.push([t[n],n]);for(i.sort(i.length&&"object"==typeof i[0][0]?function(t,e){return t[0][0]-e[0][0]}:function(t,e){return t[0]-e[0]}),n=0;n<i.length;n++)d(i[n][1],i[n][0],this);for(this.xNumSteps=this.xSteps.slice(0),n=0;n<this.xNumSteps.length;n++)h(n,this.xNumSteps[n],this)}function g(t){if(e(t))return!0;throw new Error("noUiSlider ("+Ct+"): 'format' requires 'to' and 'from' methods.")}function v(t,e){if(!i(e))throw new Error("noUiSlider ("+Ct+"): 'step' is not numeric.");t.singleStep=e}function b(t,e){if("object"!=typeof e||Array.isArray(e))throw new Error("noUiSlider ("+Ct+"): 'range' is not an object.");if(void 0===e.min||void 0===e.max)throw new Error("noUiSlider ("+Ct+"): Missing 'min' or 'max' in 'range'.");if(e.min===e.max)throw new Error("noUiSlider ("+Ct+"): 'range' 'min' and 'max' cannot be equal.");t.spectrum=new m(e,t.snap,t.singleStep)}function S(t,e){if(e=mt(e),!Array.isArray(e)||!e.length)throw new Error("noUiSlider ("+Ct+"): 'start' option is incorrect.");t.handles=e.length,t.start=e}function w(t,e){if("boolean"!=typeof(t.snap=e))throw new Error("noUiSlider ("+Ct+"): 'snap' option must be a boolean.")}function x(t,e){if("boolean"!=typeof(t.animate=e))throw new Error("noUiSlider ("+Ct+"): 'animate' option must be a boolean.")}function y(t,e){if("number"!=typeof(t.animationDuration=e))throw new Error("noUiSlider ("+Ct+"): 'animationDuration' option must be a number.")}function E(t,e){var r,n=[!1];if("lower"===e?e=[!0,!1]:"upper"===e&&(e=[!1,!0]),!0===e||!1===e){for(r=1;r<t.handles;r++)n.push(e);n.push(!1)}else{if(!Array.isArray(e)||!e.length||e.length!==t.handles+1)throw new Error("noUiSlider ("+Ct+"): 'connect' option doesn't match handle count.");n=e}t.connect=n}function C(t,e){switch(e){case"horizontal":t.ort=0;break;case"vertical":t.ort=1;break;default:throw new Error("noUiSlider ("+Ct+"): 'orientation' option is invalid.")}}function N(t,e){if(!i(e))throw new Error("noUiSlider ("+Ct+"): 'margin' option must be numeric.");if(0!==e&&(t.margin=t.spectrum.getMargin(e),!t.margin))throw new Error("noUiSlider ("+Ct+"): 'margin' option is only supported on linear sliders.")}function U(t,e){if(!i(e))throw new Error("noUiSlider ("+Ct+"): 'limit' option must be numeric.");if(t.limit=t.spectrum.getMargin(e),!t.limit||t.handles<2)throw new Error("noUiSlider ("+Ct+"): 'limit' option is only supported on linear sliders with 2 or more handles.")}function P(t,e){if(!i(e))throw new Error("noUiSlider ("+Ct+"): 'padding' option must be numeric.");if(0!==e){if(t.padding=t.spectrum.getMargin(e),!t.padding)throw new Error("noUiSlider ("+Ct+"): 'padding' option is only supported on linear sliders.");if(t.padding<0)throw new Error("noUiSlider ("+Ct+"): 'padding' option must be a positive number.");if(50<=t.padding)throw new Error("noUiSlider ("+Ct+"): 'padding' option must be less than half the range.")}}function A(t,e){switch(e){case"ltr":t.dir=0;break;case"rtl":t.dir=1;break;default:throw new Error("noUiSlider ("+Ct+"): 'direction' option was not recognized.")}}function M(t,e){if("string"!=typeof e)throw new Error("noUiSlider ("+Ct+"): 'behaviour' must be a string containing options.");var r=0<=e.indexOf("tap"),n=0<=e.indexOf("drag"),i=0<=e.indexOf("fixed"),o=0<=e.indexOf("snap"),s=0<=e.indexOf("hover");if(i){if(2!==t.handles)throw new Error("noUiSlider ("+Ct+"): 'fixed' behaviour must be used with 2 handles");N(t,t.start[1]-t.start[0])}t.events={tap:r||o,drag:n,fixed:i,snap:o,hover:s}}function O(t,e){if(!1!==e)if(!0===e){t.tooltips=[];for(var r=0;r<t.handles;r++)t.tooltips.push(!0)}else{if(t.tooltips=mt(e),t.tooltips.length!==t.handles)throw new Error("noUiSlider ("+Ct+"): must pass a formatter for all handles.");t.tooltips.forEach(function(t){if("boolean"!=typeof t&&("object"!=typeof t||"function"!=typeof t.to))throw new Error("noUiSlider ("+Ct+"): 'tooltips' must be passed a formatter or 'false'.")})}}function k(t,e){g(t.ariaFormat=e)}function V(t,e){g(t.format=e)}function F(t,e){if(void 0!==e&&"string"!=typeof e&&!1!==e)throw new Error("noUiSlider ("+Ct+"): 'cssPrefix' must be a string or `false`.");t.cssPrefix=e}function L(t,e){if(void 0!==e&&"object"!=typeof e)throw new Error("noUiSlider ("+Ct+"): 'cssClasses' must be an object.");if("string"==typeof t.cssPrefix)for(var r in t.cssClasses={},e)e.hasOwnProperty(r)&&(t.cssClasses[r]=t.cssPrefix+e[r]);else t.cssClasses=e}function z(t,e){if(!0!==e&&!1!==e)throw new Error("noUiSlider ("+Ct+"): 'useRequestAnimationFrame' option should be true (default) or false.");t.useRequestAnimationFrame=e}function Et(e){var r={margin:0,limit:0,padding:0,animate:!0,animationDuration:300,ariaFormat:H,format:H},n={step:{r:!1,t:v},start:{r:!0,t:S},connect:{r:!0,t:E},direction:{r:!0,t:A},snap:{r:!1,t:w},animate:{r:!1,t:x},animationDuration:{r:!1,t:y},range:{r:!0,t:b},orientation:{r:!1,t:C},margin:{r:!1,t:N},limit:{r:!1,t:U},padding:{r:!1,t:P},behaviour:{r:!0,t:M},ariaFormat:{r:!1,t:k},format:{r:!1,t:V},tooltips:{r:!1,t:O},cssPrefix:{r:!1,t:F},cssClasses:{r:!1,t:L},useRequestAnimationFrame:{r:!1,t:z}},i={connect:!1,direction:"ltr",behaviour:"tap",orientation:"horizontal",cssPrefix:"noUi-",cssClasses:{target:"target",base:"base",origin:"origin",handle:"handle",handleLower:"handle-lower",handleUpper:"handle-upper",horizontal:"horizontal",vertical:"vertical",background:"background",connect:"connect",ltr:"ltr",rtl:"rtl",draggable:"draggable",drag:"state-drag",tap:"state-tap",active:"active",tooltip:"tooltip",pips:"pips",pipsHorizontal:"pips-horizontal",pipsVertical:"pips-vertical",marker:"marker",markerHorizontal:"marker-horizontal",markerVertical:"marker-vertical",markerNormal:"marker-normal",markerLarge:"marker-large",markerSub:"marker-sub",value:"value",valueHorizontal:"value-horizontal",valueVertical:"value-vertical",valueNormal:"value-normal",valueLarge:"value-large",valueSub:"value-sub"},useRequestAnimationFrame:!0};e.format&&!e.ariaFormat&&(e.ariaFormat=e.format),Object.keys(n).forEach(function(t){if(void 0===e[t]&&void 0===i[t]){if(n[t].r)throw new Error("noUiSlider ("+Ct+"): '"+t+"' is required.");return!0}n[t].t(r,void 0===e[t]?i[t]:e[t])}),r.pips=e.pips;var t=[["left","top"],["right","bottom"]];return r.style=t[r.dir][r.ort],r.styleOposite=t[r.dir?0:1][r.ort],r}function j(t,p,o){function f(t,e){var r=st.createElement("div");return e&&gt(r,e),t.appendChild(r),r}function n(t,e){var r=f(t,p.cssClasses.origin),n=f(r,p.cssClasses.handle);return n.setAttribute("data-handle",e),n.setAttribute("tabindex","0"),n.setAttribute("role","slider"),n.setAttribute("aria-orientation",p.ort?"vertical":"horizontal"),0===e?gt(n,p.cssClasses.handleLower):e===p.handles-1&&gt(n,p.cssClasses.handleUpper),r}function i(t,e){return!!e&&f(t,p.cssClasses.connect)}function e(t,e){_=[],(W=[]).push(i(e,t[0]));for(var r=0;r<p.handles;r++)_.push(n(e,r)),tt[r]=r,W.push(i(e,t[r+1]))}function r(t){gt(t,p.cssClasses.target),0===p.dir?gt(t,p.cssClasses.ltr):gt(t,p.cssClasses.rtl),0===p.ort?gt(t,p.cssClasses.horizontal):gt(t,p.cssClasses.vertical),I=f(t,p.cssClasses.base)}function s(t,e){return!!p.tooltips[e]&&f(t.firstChild,p.cssClasses.tooltip)}function a(){var i=_.map(s);B("update",function(t,e,r){if(i[e]){var n=t[e];!0!==p.tooltips[e]&&(n=p.tooltips[e].to(r[e])),i[e].innerHTML=n}})}function l(){B("update",function(t,e,s,r,a){tt.forEach(function(t){var e=_[t],r=O(Z,t,0,!0,!0,!0),n=O(Z,t,100,!0,!0,!0),i=a[t],o=p.ariaFormat.to(s[t]);e.children[0].setAttribute("aria-valuemin",r.toFixed(1)),e.children[0].setAttribute("aria-valuemax",n.toFixed(1)),e.children[0].setAttribute("aria-valuenow",i.toFixed(1)),e.children[0].setAttribute("aria-valuetext",o)})})}function u(t,e,r){if("range"===t||"steps"===t)return rt.xVal;if("count"===t){if(!e)throw new Error("noUiSlider ("+Ct+"): 'values' required for mode 'count'.");var n,i=100/(e-1),o=0;for(e=[];(n=o++*i)<=100;)e.push(n);t="positions"}return"positions"===t?e.map(function(t){return rt.fromStepping(r?rt.getStep(t):t)}):"values"===t?r?e.map(function(t){return rt.fromStepping(rt.getStep(rt.toStepping(t)))}):e:void 0}function c(d,h,m){function g(t,e){return(t+e).toFixed(7)/1}var v={},t=rt.xVal[0],e=rt.xVal[rt.xVal.length-1],b=!1,S=!1,w=0;return(m=pt(m.slice().sort(function(t,e){return t-e})))[0]!==t&&(m.unshift(t),b=!0),m[m.length-1]!==e&&(m.push(e),S=!0),m.forEach(function(t,e){var r,n,i,o,s,a,l,u,c,p=t,f=m[e+1];if("steps"===h&&(r=rt.xNumSteps[e]),r||(r=f-p),!1!==p&&void 0!==f)for(r=Math.max(r,1e-7),n=p;n<=f;n=g(n,r)){for(l=(s=(o=rt.toStepping(n))-w)/d,c=s/(u=Math.round(l)),i=1;i<=u;i+=1)v[(w+i*c).toFixed(5)]=["x",0];a=-1<m.indexOf(n)?1:"steps"===h?2:0,!e&&b&&(a=0),n===f&&S||(v[o.toFixed(5)]=[n,a]),w=o}}),v}function d(e,n,i){function o(t,e){var r=e===p.cssClasses.value,n=r?a:l;return e+" "+(r?u:c)[p.ort]+" "+n[t]}function r(t,e){e[1]=e[1]&&n?n(e[0],e[1]):e[1];var r=f(s,!1);r.className=o(e[1],p.cssClasses.marker),r.style[p.style]=t+"%",e[1]&&((r=f(s,!1)).className=o(e[1],p.cssClasses.value),r.style[p.style]=t+"%",r.innerText=i.to(e[0]))}var s=st.createElement("div"),a=[p.cssClasses.valueNormal,p.cssClasses.valueLarge,p.cssClasses.valueSub],l=[p.cssClasses.markerNormal,p.cssClasses.markerLarge,p.cssClasses.markerSub],u=[p.cssClasses.valueHorizontal,p.cssClasses.valueVertical],c=[p.cssClasses.markerHorizontal,p.cssClasses.markerVertical];return gt(s,p.cssClasses.pips),gt(s,0===p.ort?p.cssClasses.pipsHorizontal:p.cssClasses.pipsVertical),Object.keys(e).forEach(function(t){r(t,e[t])}),s}function h(){G&&(ut(G),G=null)}function m(t){h();var e=t.mode,r=t.density||1,n=t.filter||!1,i=c(r,e,u(e,t.values||!1,t.stepped||!1)),o=t.format||{to:Math.round};return G=Q.appendChild(d(i,n,o))}function g(){var t=I.getBoundingClientRect(),e="offset"+["Width","Height"][p.ort];return 0===p.ort?t.width||I[e]:t.height||I[e]}function v(e,r,n,i){var o=function(t){return!Q.hasAttribute("disabled")&&(!bt(Q,p.cssClasses.tap)&&(!!(t=b(t,i.pageOffset))&&(!(e===J.start&&void 0!==t.buttons&&1<t.buttons)&&((!i.hover||!t.buttons)&&(K||t.preventDefault(),t.calcPoint=t.points[p.ort],void n(t,i))))))},s=[];return e.split(" ").forEach(function(t){r.addEventListener(t,o,!!K&&{passive:!0}),s.push([t,o])}),s}function b(t,e){var r,n,i=0===t.type.indexOf("touch"),o=0===t.type.indexOf("mouse"),s=0===t.type.indexOf("pointer");if(0===t.type.indexOf("MSPointer")&&(s=!0),i){if(1<t.touches.length)return!1;r=t.changedTouches[0].pageX,n=t.changedTouches[0].pageY}return e=e||St(st),(o||s)&&(r=t.clientX+e.x,n=t.clientY+e.y),t.pageOffset=e,t.points=[r,n],t.cursor=o||s,t}function S(t){var e=100*(t-ft(I,p.ort))/g();return p.dir?100-e:e}function w(n){var i=100,o=!1;return _.forEach(function(t,e){if(!t.hasAttribute("disabled")){var r=Math.abs(Z[e]-n);r<i&&(o=e,i=r)}}),o}function x(t,n,r,e){var i=r.slice(),o=[!t,t],s=[t,!t];e=e.slice(),t&&e.reverse(),1<e.length?e.forEach(function(t,e){var r=O(i,t,i[t]+n,o[e],s[e],!1);!1===r?n=0:(n=r-i[t],i[t]=r)}):o=s=[!0];var a=!1;e.forEach(function(t,e){a=L(t,r[t]+n,o[e],s[e])||a}),a&&e.forEach(function(t){y("update",t),y("slide",t)})}function y(r,n,i){Object.keys(it).forEach(function(t){var e=t.split(".")[0];r===e&&it[t].forEach(function(t){t.call($,nt.map(p.format.to),n,nt.slice(),i||!1,Z.slice())})})}function E(t,e){"mouseout"===t.type&&"HTML"===t.target.nodeName&&null===t.relatedTarget&&N(t,e)}function C(t,e){if(-1===navigator.appVersion.indexOf("MSIE 9")&&0===t.buttons&&0!==e.buttonsProperty)return N(t,e);var r=(p.dir?-1:1)*(t.calcPoint-e.startCalcPoint);x(0<r,100*r/e.baseSize,e.locations,e.handleNumbers)}function N(t,e){et&&(vt(et,p.cssClasses.active),et=!1),t.cursor&&(lt.style.cursor="",lt.removeEventListener("selectstart",ct)),ot.forEach(function(t){at.removeEventListener(t[0],t[1])}),vt(Q,p.cssClasses.drag),F(),e.handleNumbers.forEach(function(t){y("change",t),y("set",t),y("end",t)})}function U(t,e){if(1===e.handleNumbers.length){var r=_[e.handleNumbers[0]];if(r.hasAttribute("disabled"))return!1;gt(et=r.children[0],p.cssClasses.active)}t.stopPropagation();var n=v(J.move,at,C,{startCalcPoint:t.calcPoint,baseSize:g(),pageOffset:t.pageOffset,handleNumbers:e.handleNumbers,buttonsProperty:t.buttons,locations:Z.slice()}),i=v(J.end,at,N,{handleNumbers:e.handleNumbers}),o=v("mouseout",at,E,{handleNumbers:e.handleNumbers});ot=n.concat(i,o),t.cursor&&(lt.style.cursor=getComputedStyle(t.target).cursor,1<_.length&&gt(Q,p.cssClasses.drag),lt.addEventListener("selectstart",ct,!1)),e.handleNumbers.forEach(function(t){y("start",t)})}function P(t){t.stopPropagation();var e=S(t.calcPoint),r=w(e);return!1!==r&&(p.events.snap||dt(Q,p.cssClasses.tap,p.animationDuration),L(r,e,!0,!0),F(),y("slide",r,!0),y("update",r,!0),y("change",r,!0),y("set",r,!0),void(p.events.snap&&U(t,{handleNumbers:[r]})))}function A(t){var e=S(t.calcPoint),r=rt.getStep(e),n=rt.fromStepping(r);Object.keys(it).forEach(function(t){"hover"===t.split(".")[0]&&it[t].forEach(function(t){t.call($,n)})})}function M(o){o.fixed||_.forEach(function(t,e){v(J.start,t.children[0],U,{handleNumbers:[e]})}),o.tap&&v(J.start,I,P,{}),o.hover&&v(J.move,I,A,{hover:!0}),o.drag&&W.forEach(function(t,e){if(!1!==t&&0!==e&&e!==W.length-1){var r=_[e-1],n=_[e],i=[t];gt(t,p.cssClasses.draggable),o.fixed&&(i.push(r.children[0]),i.push(n.children[0])),i.forEach(function(t){v(J.start,t,U,{handles:[r,n],handleNumbers:[e-1,e]})})}})}function O(t,e,r,n,i,o){return 1<_.length&&(n&&0<e&&(r=Math.max(r,t[e-1]+p.margin)),i&&e<_.length-1&&(r=Math.min(r,t[e+1]-p.margin))),1<_.length&&p.limit&&(n&&0<e&&(r=Math.min(r,t[e-1]+p.limit)),i&&e<_.length-1&&(r=Math.max(r,t[e+1]-p.limit))),p.padding&&(0===e&&(r=Math.max(r,p.padding)),e===_.length-1&&(r=Math.min(r,100-p.padding))),!((r=ht(r=rt.getStep(r)))===t[e]&&!o)&&r}function k(t){return t+"%"}function V(t,e){Z[t]=e,nt[t]=rt.fromStepping(e);var r=function(){_[t].style[p.style]=k(e),z(t),z(t+1)};window.requestAnimationFrame&&p.useRequestAnimationFrame?window.requestAnimationFrame(r):r()}function F(){tt.forEach(function(t){var e=50<Z[t]?-1:1,r=3+(_.length+e*t);_[t].childNodes[0].style.zIndex=r})}function L(t,e,r,n){return!1!==(e=O(Z,t,e,r,n,!1))&&(V(t,e),!0)}function z(t){if(W[t]){var e=0,r=100;0!==t&&(e=Z[t-1]),t!==W.length-1&&(r=Z[t]),W[t].style[p.style]=k(e),W[t].style[p.styleOposite]=k(100-r)}}function j(t,e){null!==t&&!1!==t&&("number"==typeof t&&(t=String(t)),!1===(t=p.format.from(t))||isNaN(t)||L(e,rt.toStepping(t),!1,!1))}function H(t,e){var r=mt(t),n=void 0===Z[0];e=void 0===e||!!e,r.forEach(j),p.animate&&!n&&dt(Q,p.cssClasses.tap,p.animationDuration),tt.forEach(function(t){L(t,Z[t],!0,!1)}),F(),tt.forEach(function(t){y("update",t),null!==r[t]&&e&&y("set",t)})}function D(t){H(p.start,t)}function q(){var t=nt.map(p.format.to);return 1===t.length?t[0]:t}function T(){for(var t in p.cssClasses)p.cssClasses.hasOwnProperty(t)&&vt(Q,p.cssClasses[t]);for(;Q.firstChild;)Q.removeChild(Q.firstChild);delete Q.noUiSlider}function R(){return Z.map(function(t,e){var r=rt.getNearbySteps(t),n=nt[e],i=r.thisStep.step,o=null;!1!==i&&n+i>r.stepAfter.startValue&&(i=r.stepAfter.startValue-n),o=n>r.thisStep.startValue?r.thisStep.step:!1!==r.stepBefore.step&&n-r.stepBefore.highestStep,100===t?i=null:0===t&&(o=null);var s=rt.countStepDecimals();return null!==i&&!1!==i&&(i=Number(i.toFixed(s))),null!==o&&!1!==o&&(o=Number(o.toFixed(s))),[o,i]})}function B(t,e){it[t]=it[t]||[],it[t].push(e),"update"===t.split(".")[0]&&_.forEach(function(t,e){y("update",e)})}function X(t){var n=t&&t.split(".")[0],i=n&&t.substring(n.length);Object.keys(it).forEach(function(t){var e=t.split(".")[0],r=t.substring(e.length);n&&n!==e||i&&i!==r||delete it[t]})}function Y(e,t){var r=q(),n=["margin","limit","padding","range","animate","snap","step","format"];n.forEach(function(t){void 0!==e[t]&&(o[t]=e[t])});var i=Et(o);n.forEach(function(t){void 0!==e[t]&&(p[t]=i[t])}),rt=i.spectrum,p.margin=i.margin,p.limit=i.limit,p.padding=i.padding,p.pips&&m(p.pips),Z=[],H(e.start||r,t)}var I,_,W,$,G,J=wt(),K=yt()&&xt(),Q=t,Z=[],tt=[],et=!1,rt=p.spectrum,nt=[],it={},ot=null,st=t.ownerDocument,at=st.documentElement,lt=st.body;if(Q.noUiSlider)throw new Error("noUiSlider ("+Ct+"): Slider was already initialized.");return r(Q),e(p.connect,I),$={destroy:T,steps:R,on:B,off:X,get:q,set:H,reset:D,__moveHandles:function(t,e,r){x(t,e,Z,r)},options:o,updateOptions:Y,target:Q,removePips:h,pips:m},M(p.events),H(p.start),p.pips&&m(p.pips),p.tooltips&&a(),l(),$}function t(t,e){if(!t||!t.nodeName)throw new Error("noUiSlider ("+Ct+"): create requires a single element, got: "+t);var r=j(t,Et(e,t),e);return t.noUiSlider=r}var Ct="10.0.0";m.prototype.getMargin=function(t){var e=this.xNumSteps[0];if(e&&t/e%1!=0)throw new Error("noUiSlider ("+Ct+"): 'limit', 'margin' and 'padding' must be divisible by step.");return 2===this.xPct.length&&s(this.xVal,t)},m.prototype.toStepping=function(t){return n(this.xVal,this.xPct,t)},m.prototype.fromStepping=function(t){return p(this.xVal,this.xPct,t)},m.prototype.getStep=function(t){return f(this.xPct,this.xSteps,this.snap,t)},m.prototype.getNearbySteps=function(t){var e=c(t,this.xPct);return{stepBefore:{startValue:this.xVal[e-2],step:this.xNumSteps[e-2],highestStep:this.xHighestCompleteStep[e-2]},thisStep:{startValue:this.xVal[e-1],step:this.xNumSteps[e-1],highestStep:this.xHighestCompleteStep[e-1]},stepAfter:{startValue:this.xVal[e-0],step:this.xNumSteps[e-0],highestStep:this.xHighestCompleteStep[e-0]}}},m.prototype.countStepDecimals=function(){var t=this.xNumSteps.map(r);return Math.max.apply(null,t)},m.prototype.convert=function(t){return this.getStep(this.toStepping(t))};var H={to:function(t){return void 0!==t&&t.toFixed(2)},from:Number};return{version:Ct,create:t}});