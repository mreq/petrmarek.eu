class Bubble {
  constructor (titleElement) {
    this.titleElement = titleElement
    this.createBubbleElement()
    this.bindTitleElement()
    this.fadeIn = this.fadeIn.bind(this)
    setTimeout(this.fadeIn, 0)
  }

  createBubbleElement () {
    this.bubble = document.createElement('div')
    this.bubble.className = 'm-bubble'
    this.bubble.innerHTML = `<div class="m-inner">${this.titleElement.title}</div>`
    document.body.appendChild(this.bubble)
  }

  bindTitleElement () {
    this.hide = this.hide.bind(this)
    this.titleElement.addEventListener('mouseleave', this.hide)
  }

  fadeIn () {
    this.bubble.className += ' m-fade-in'
  }

  hide () {
    this.titleElement.removeEventListener('mouseleave', this.hide)
    this.bubble.className += ' m-fade-out'
    setTimeout(() => document.body.removeChild(this.bubble), 300)
  }
}

let bindNodeList = function (nodeList, eventName, handler) {
  for (var i = nodeList.length - 1; i >= 0; i--) {
    nodeList[i].addEventListener(eventName, handler)
  }
}

let showInfoBubble = function (event) {
  return new Bubble(event.target)
}

let initBubbles = function () {
  bindNodeList(document.getElementsByClassName('m-title'), 'mouseenter', showInfoBubble)
}

initBubbles()
