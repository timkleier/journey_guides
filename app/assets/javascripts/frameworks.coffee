# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".foreground .resource").popup({ 
    offset: -12, inline: true, hoverable: true, distanceAway: -15 
  });
  
  $(".foreground .user").popup({ 
    offset: -12, inline: true, hoverable: true, distanceAway: -15 
  });