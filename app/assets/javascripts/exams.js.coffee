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


      list_group = $(this).children('.list-group-item')
      if list_group.hasClass('selected')
        list_group.removeClass('selected');
      else
        list_group.addClass('selected');
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
      if added == true
        questions.splice(questions.indexOf(ques_id.toString()),1)
      q = questions.join(',')
      $('#selected_questions').val(q) 

      list_group = $(this).children('.list-group-item')
      if list_group.hasClass('selected')
        list_group.removeClass('selected');
      else
        list_group.addClass('selected');

    )

$(document).on 'ready page:load', ready