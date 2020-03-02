// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------
import "bootstrap";

import { loadDynamicBannerText } from '../plugins/banner';
// import { initFlatpickr } from "../plugins/init_flatpickr";
import { initMapbox, initAutocomplete } from '../plugins/init_mapbox';
import { initTeachers } from '../plugins/init_select_teacher';
import { initCalendar } from '../plugins/init_refresh_calendar';
import { initSweetalert } from '../plugins/init_sweetalert';


document.addEventListener('turbolinks:load', () => {
  loadDynamicBannerText();
  // initFlatpickr();
  initMapbox();
  initAutocomplete();
  initTeachers();
  initCalendar();
});

initSweetalert('#sweet-alert-demo', {
  title: "Félicitations !",
  text: "Ton cours est confirmé",
  icon: "success"
});
