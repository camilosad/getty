# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
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

  $('.datetimepicker').datetimepicker();

  $('#aulas').on 'cocoon:after-insert', ->
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

    $('.datepicker').datepicker()