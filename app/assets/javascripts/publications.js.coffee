# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  # Display an image thumb when user choose an image as publication thumbnail
  $('.edit_publication input[type=file], .new_publication input[type=file]').change (data) ->
    thumb = this.files[0]
    $thumbnail = $(this).parents('form').find('.publication-thumbnail')
    console.log $thumbnail
    if thumb.type.match('image.*')
      reader = new FileReader()
      $image = $('<img>') 
      reader.onload = ->
        $image.attr 'src', reader.result
        $thumbnail.slideUp ->
          $(this).html($image).slideDown()
      reader.readAsDataURL(thumb)


