pageNav = ->
  body = document.getElementById('m-body')
  handle = ->
    body.classList = ["m-show-#{window.location.hash.split('#').pop()}"]

  $(window).on 'hashchange', handle
  handle()

$ pageNav
