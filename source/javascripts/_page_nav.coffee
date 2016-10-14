pageNav = ->
  body = document.getElementById('m-body')
  handle = ->
    hash = window.location.hash.split('#').pop()
    classes = body.className.replace(/\s*m-show-\w+/, '')
    if ['contact', 'about', 'work'].indexOf(hash) is -1
      window.location.hash = ''
    else
      classes += " m-show-#{hash}"
    body.className = classes

  $(window).on 'hashchange', handle
  handle()

  $('.m-section > .container, .m-menu').on 'click', (e) -> e.stopPropagation()

  setTimeout (-> body.className += ' m-loaded'), 0

$ pageNav
