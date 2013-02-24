# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Activate selected supporting toggle button
$("button[data-supporting=" + $('#supporting').val() + "]").addClass('active')

# Set supporting value to the hidden field
$("#supporting-toggle button").click -> 
  $('#supporting').val($(this).data('supporting'))
