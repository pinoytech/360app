# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

ready = ->

  $('#category_selection').on "change", ->
    $.get('/exams/category_questions', category_id: $('#category_selection option:selected').val())

  $('.right-button').on "click", ->
    $.get('/exams/select_questions', question_ids: $('#selected_questions').val(), category_id: $('#category_selection option:selected').val())

  $('.left-button').on "click", ->
    $.get('/exams/remove_questions', question_ids: $('#selected_questions').val(), category_id: $('#category_selection option:selected').val())

  $('.question-list .question').on('click', ->
      selected_questions = $("#selected_questions").val()
      if selected_questions.length == 0
        questions = []
      else
        questions = selected_questions.split(',')
      ques_id = $(this).data('ques_id')  
      added = false
      $.map(questions, (el, i)->
        if (el.toString() == ques_id.toString()) 
          added = true;
      )
      if added == false
        questions.push(ques_id.toString())
      q = questions.join(',')
      $('#selected_questions').val(q) 
    )

  $('.selected-question-list .question').on('click', ->
      selected_questions = $("#selected_questions").val()
      if selected_questions.length == 0
        questions = []
      else
        questions = selected_questions.split(',')
      ques_id = $(this).data('ques_id')  
      added = false
      $.map(questions, (el, i)->
        if (el.toString() == ques_id.toString()) 
          added = true;
      )
      if added == false
        console.log questions.indexOf(ques_id.toString())
        questions.splice(questions.indexOf(ques_id.toString()),1)
      q = questions.join(',')
      $('#selected_questions').val(q) 
    )

$(document).on 'ready page:load', ready