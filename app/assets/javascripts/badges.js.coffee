@popOver =
  error: (msg)->
    popOver.open('Oops! Something went wrong.', msg)
  open: (title, msg)->
    alert "#{title}\n\n#{msg}"
  tooltip: ->
    $(".js-popover").popover(
      trigger: "manual"
      html: true
    ).on("click", (e) ->
      e.preventDefault()
    ).on("mouseenter", ->
      _this = this
      $(this).popover "show"
      $(this).siblings(".popover").on "mouseleave", ->
        $(_this).popover "hide"

    ).on "mouseleave", ->
      _this = this
      setTimeout (->
        $(_this).popover "hide"  unless $(".popover:hover").length
      ), 100