jQuery ->
  $('.values').blur ->
    if $(@form._method).val() != 'patch' && $(this).val() != ''
      $.ajax
        url: $(this.form).attr('action')
        data: $(this.form).serialize()
        dataType: 'script'
        type: 'POST'
    
