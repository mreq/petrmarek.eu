var replaceAncientContent = function () {
  document.open()
  document.write('<div style="text-align: center; max-width: 500px; margin: 100px auto;"> <h1 style="font-size: 5em; font-weight: normal;">🐚</h1> <p>Your browser is ancient!</p> <p><a href="https://browser-update.org/update.html?force_outdated=true">Upgrade it</a> and come back.</p> </div>')
  document.close()
  throw Error('Your browser is ancient!')
}

setTimeout(replaceAncientContent, 0)
