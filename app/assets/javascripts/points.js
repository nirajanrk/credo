jQuery(function($) {
  $('#add_new_evidence').on('click', function(){
    $('#add_new_evidence').hide();
  });

  $('form#new_point').on('click', '.remove_evidence', function(){
    $('#add_new_evidence').show();
  });
})
