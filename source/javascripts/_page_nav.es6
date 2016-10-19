let pageNav = function () {
  let body = document.getElementById('m-body')

  let handle = function () {
    let hash = window.location.hash.split('#').pop()
    let classes = body.className.replace(/\s*m-show-\w+/, '')

    if (['contact', 'about', 'work'].indexOf(hash) === -1) {
      window.location.hash = ''
    } else {
      classes += ` m-show-${hash}`
    }

    body.className = classes
  }

  window.onhashchange = handle
  handle()

  let setBodyToLoaded = function () {
    body.className += ' m-loaded'
  }

  setTimeout(setBodyToLoaded, 0)
}

pageNav()
