# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

ready = ->
  $('#category_selection').on "change", ->
    $.get('/exams/category_questions', category_id: $('#category_selection option:selected').val())

$(document).on 'ready page:load', ready