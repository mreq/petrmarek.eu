let replaceEm = function (el) {
  let escaped = el.getAttribute('data-em')
  let email = escaped.replace('/', '@')
  el.setAttribute('href', `mailto:${email}`)
  el.innerHTML = email
}

let protectEmails = function () {
  let emails = document.querySelectorAll('.m-em')
  for (var i = emails.length - 1; i >= 0; i--) {
    replaceEm(emails[i])
  }
}

protectEmails()
