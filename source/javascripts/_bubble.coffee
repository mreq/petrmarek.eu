initBubble = ->
  $(document).on(
    'mouseenter'
    '.m-title'
    -> showInfoBubble(this)
  ).on(
    'mouseleave'
    '.m-title'
    hideInfoBubbles
  ).on(
    'mouseenter'
    '.m-bubble'
    -> $(this).stop()
  ).on(
    'mouseleave'
    '.m-bubble'
    hideInfoBubbles
  )

showInfoBubble = (element) ->
  bubble = $('<div class="m-bubble"><div class="m-inner">' + element.title  + '</div></div>')
  $('body').append bubble
  bubble.fadeIn 300

hideInfoBubbles = ->
  bubbles = $('body').children '.m-bubble'
  bubbles.fadeOut 300, ->
    $(this).remove()

$ initBubble
