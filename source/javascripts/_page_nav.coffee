pageNav = ->
  body = document.getElementById('m-body')
  handle = ->
    hash = window.location.hash.split('#').pop()
    if ['contact', 'about', 'work'].indexOf(hash) is -1
      body.classList = []
      window.location.hash = ''
    else
      body.classList = ["m-show-#{hash}"]

  $(window).on 'hashchange', handle
  handle()

  $('#m-body').on 'click', (e) -> window.location.hash = ''
  $('.m-section > .container, .m-menu').on 'click', (e) -> e.stopPropagation()

$ pageNav
