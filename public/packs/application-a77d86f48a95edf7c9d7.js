!function(t){var e={};function r(n){if(e[n])return e[n].exports;var o=e[n]={i:n,l:!1,exports:{}};return t[n].call(o.exports,o,o.exports,r),o.l=!0,o.exports}r.m=t,r.c=e,r.d=function(t,e,n){r.o(t,e)||Object.defineProperty(t,e,{configurable:!1,enumerable:!0,get:n})},r.n=function(t){var e=t&&t.__esModule?function(){return t.default}:function(){return t};return r.d(e,"a",e),e},r.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},r.p="/packs/",r(r.s=0)}([function(t,e,r){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var n=r(2);r.n(n);r(1)},function(t,e){$(document).on("turbolinks:load",function(){return(new Chatroom).scrollDownChat().recordKeyDown()}),this.Chatroom=function(){function t(t){this.data=t,this.submit=$('[data-send="message"]'),this.textarea=$('[data-textarea="message"]'),this.input=$('[data-id="chatroom-input"]'),this.scrollbar=$('[data-id="scroll-bar"]'),null!=this.data&&new Message(this.data)}return t.prototype.recordKeyDown=function(){var t;return this.input.keydown((t=this,function(e){if("Enter"===e.key&&t.hasMessage())return t.sendMessage()})),this},t.prototype.sendMessage=function(){return this.submit.click(),this.textarea.val(""),!1},t.prototype.scrollDownChat=function(){var t;return null!=this.scrollbar&&(t=this.scrollbar[0].scrollHeight,this.scrollbar.scrollTop(t)),this},t.prototype.hasMessage=function(){return""!==this.input.val().trim()},t}()},function(t,e){}]);
//# sourceMappingURL=application-a77d86f48a95edf7c9d7.js.map