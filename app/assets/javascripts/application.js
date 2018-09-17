// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function main() {
    
  var counter = 0;
  var checkboxes = document.querySelectorAll('input[type=checkbox]');
  
  for (var i = 0; i < checkboxes.length; i++) {   
    var checkbox = checkboxes[i];    

    checkbox.addEventListener('change', function() {

      if (this.checked) {
        counter++;
      } else {
        counter--;
      }

      if (counter === 4 ) {
        checkboxes.forEach(function (e) {
          if(!e.checked) {
            e.disabled = true;
          }
        })
      } else {
        checkboxes.forEach(function (e) {
          if(e.disabled) {
            e.disabled = false;
          }
        })
      }
      
    })

  }

  // var checked = document.querySelectorAll('input:checked');

  // if (checked.length === 0) {
  //     // there are no checked checkboxes
  //     console.log('no checkboxes checked');
  // } else {
  //     // there are some checked checkboxes
  //     console.log(checked.length + ' checkboxes checked');
  // }

}

window.addEventListener("load", main);
