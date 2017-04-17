$(document).on 'turbolinks:load', ->


  $('.datetimepicker').datetimepicker format: 'DD/MM/YYYY HH:mm Z'


  # Flashes
  $('.alert').fadeIn(400).delay(5000, 'fx').slideUp ->
    $('.alert').remove()

