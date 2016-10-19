let replaceEm = function (el) {
  let escaped = el.getAttribute('data-em')
  let email = escaped.replace('/', '@')
  el.setAttribute('href', `mailto:${email}`)
  el.innerHTML = email
}

let protectEmails = function () {
  document.querySelectorAll('.m-em').forEach(replaceEm)
}

protectEmails()
