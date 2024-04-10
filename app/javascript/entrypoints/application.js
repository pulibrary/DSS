/* eslint no-console:0 */
// This file is automatically compiled, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import { createApp } from "vue";
import { LuxLibraryFooter, LuxLibraryHeader, LuxMenuBar, LuxLogoUniversity, LuxLogoLibraryIcon, LuxLibraryLogo, LuxLogoLibrary, LuxWrapper, LuxSpacer } from "lux-design-system";
import "lux-design-system/dist/style.css";

// Create a factory function that will create vue
// apps, which we can then mount to any element with
// the class .lux
const app = createApp({});
const createMyApp = () => createApp(app);

// create the LUX app and mount it to wrappers with class="lux"
document.addEventListener('DOMContentLoaded', () => {
  const elements = document.getElementsByClassName('lux')
  for (let i = 0; i < elements.length; i++) {
    createMyApp()
      .component("lux-library-footer", LuxLibraryFooter)
      .component("lux-library-header", LuxLibraryHeader)
      .component("lux-menu-bar", LuxMenuBar)
      .component("lux-logo-university", LuxLogoUniversity)
      .component("lux-logo-library-icon", LuxLogoLibraryIcon)
      .component("lux-library-logo", LuxLibraryLogo)
      .component("lux-logo-library", LuxLogoLibrary)
      .component("lux-wrapper", LuxWrapper)
      .component("lux-spacer", LuxSpacer)
      .mount(elements[i]);
  }
})

// Modified from code found: https://petrey.co/2017/05/the-most-effective-way-to-avoid-the-fouc/
let page_ready = false;
const show_dom = (H) => H.className = H.className.replace(/\bno-js\b/, 'js');

window.addEventListener('load', () => {
  if (page_ready) show_dom(document.documentElement);
  page_ready = true;
});

window.addEventListener('DOMContentLoaded', () => {
  if (page_ready) show_dom(document.documentElement);
  page_ready = true;
});