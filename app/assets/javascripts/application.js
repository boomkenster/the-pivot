// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function(){
  
  toggleCategory(".lager", ".lager_beers")
  toggleCategory(".stout", ".stout_beers")
  toggleCategory(".ipa", ".ipa_beers")
  toggleCategory(".ale", ".ale_beers")
  toggleCategory(".blonde", ".blonde_beers")
  toggleCategory(".pale", ".pale_beers")
  toggleCategory(".amber", ".amber_beers")
  toggleCategory(".porter", ".porter_beers")
  toggleAllCategory()

  
  
  
  function toggleCategory(categoryID, beerID){
    var currentCategory = this.value;
    
    $(categoryID).click(function(){
      $(beerID).toggleClass("hidden");
    });
  }
  
  function toggleAllCategory(){
    $(".all").click(function(){
      $(".two").toggleClass("hidden");
    });
  }  
  
  
});