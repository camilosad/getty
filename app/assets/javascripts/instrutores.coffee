# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

  # mask date fields
  $(".date-masked").inputmask("99/99/9999")

  # mask time fields
  $(".time-masked").inputmask("99:99")

  $(".nested-fields").each (index, element) ->
    dinamica = $(element).find("input[id$='dinamica']")
    week = $(element).find('.week')
    count = $(element).find('.count')
    if ($(dinamica).is(':checked'))
      $(week).show()
      $(count).hide()
    else
      $(week).hide()
      $(count).show()

  $("input[id$='dinamica']").change ->
    nested_form_id = $(@).attr('id').split('_')[3]
    nested_form = $(@).parent().parent().parent().parent()
    week = $(nested_form.find('.week'))
    count = $(nested_form.find('.count'))

    if($(@).is(":checked"))
      $(week).show()
      $(count).hide()
    else
      $(week).hide()
      $(count).show()

  # repeating behavior inside nested forms

  $('#aulas').on 'cocoon:after-insert', ->
    # mask date fields
    $(".date-masked").inputmask("99/99/9999")

    # mask time fields
    $(".time-masked").inputmask("99:99")

    $(".nested-fields").each (index, element) ->
      dinamica = $(element).find("input[id$='dinamica']")
      week = $(element).find('.week')
      count = $(element).find('.count')
      if ($(dinamica).is(':checked'))
        $(week).show()
        $(count).hide()
      else
        $(week).hide()
        $(count).show()

    $("input[id$='dinamica']").change ->
      nested_form_id = $(@).attr('id').split('_')[3]
      nested_form = $(@).parent().parent().parent().parent()
      week = $(nested_form.find('.week'))
      count = $(nested_form.find('.count'))
      if($(@).is(":checked"))
        $(week).show()
        $(count).hide()
      else
        $(week).hide()
        $(count).show()

$(document).ready(ready)
$(document).on('turbolinks:load', ready)