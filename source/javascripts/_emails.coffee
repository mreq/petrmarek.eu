protectEmails = ->
  $('.m-em').filter('[data-em]').each ->
    t = $(this)
    e = t.data('em').replace '/', '@'
    t.attr('href', 'mailto:'+e).not('.m-custom-text').text e

$ protectEmails
