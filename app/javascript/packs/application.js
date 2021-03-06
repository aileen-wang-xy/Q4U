// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

window.jQuery = $;
window.$ = $;

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

global.toastr = require('toastr')
import "../stylesheets/application"

import 'bootstrap'

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
})

import './bootstrap_custom.js'
import './flatpickr.js'
import './jquery.raty.js'
// import "javascripts/jquery.raty.js"
import starhalf from 'images/star-half.png';
import staroff from 'images/star-off.png';
import staron from 'images/star-on.png';

