// This file is included in all sites and subsites.  This is a
// manifest file that'll be compiled into including all the files
// listed below.  Add new JavaScript/Coffee code in separate files in
// the application directory and they'll automatically be included.
// It's not advisable to add code directly here, but if you do, it'll
// appear at the bottom of the the compiled file.
//
//= require jquery
//= require migrate
//= require jquery_ujs
//= require jquery-ui
//= require anytime
//= require_tree ./application


$(function() {
   // format all date fields
   var theFormat = "%Y-%m-%d %H:%i";
   var anyTime = new AnyTime.Converter({ format: theFormat });
   var oldDate;
   $(".datetime").each(function() {
      oldDate = $(this).attr('value');
      if(oldDate) {
         oldDate = anyTime.format(anyTime.parse());
         alert(oldDate);
         $(this).attr('value', oldDate);
      }
   });
   $(".datetime").AnyTime_picker(
      {
         format: theFormat
      });
});
