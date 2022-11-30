/* eslint no-console:0 */
// This file is automatically compiled, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Vue from "vue/dist/vue.esm"
import system from "lux-design-system"
import "lux-design-system/dist/system/system.css"
import "lux-design-system/dist/system/tokens/tokens.scss"

Vue.use(system)

// create the LUX app and mount it to wrappers with class="lux"
document.addEventListener('DOMContentLoaded', () => {
  var elements = document.getElementsByClassName('lux')
  for(var i = 0; i < elements.length; i++){
    new Vue({
      el: elements[i]
    })
  }
})

// Modified from code found: https://petrey.co/2017/05/the-most-effective-way-to-avoid-the-fouc/
let page_ready = false;
const show_dom = (H) => H.className=H.className.replace(/\bno-js\b/,'js');

window.addEventListener('load', () => {
  if (page_ready) show_dom(document.documentElement); 
  page_ready = true;
});

window.addEventListener('DOMContentLoaded', () => {
  if (page_ready) show_dom(document.documentElement);
  page_ready = true;
});