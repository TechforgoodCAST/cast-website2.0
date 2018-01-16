var Hamburger = (function () {

  var hamburgerAttribute  = 'hamburger'
  var mobileMenuAttribute = 'mobile-nav'
  var openAttribute       = 'open'
  var closedAttribute     = 'closed'

  var displayBlock = 'db'
  var displayNone  = 'dn'

  function addListener () {
    $hamburger().addEventListener('click', toggle)
  }

  function toggle () {
    return isOpen()
      ? close()
      : open()
  }

  function isOpen () {
    return $hamburger().getAttribute(openAttribute)
  }

  function open () {
    swapAttributes($hamburger(), openAttribute, closedAttribute)
    swapClasses($menu(), displayBlock, displayNone)
  }

  function close () {
    swapAttributes($hamburger(), closedAttribute, openAttribute)
    swapClasses($menu(), displayNone, displayBlock)
  }

  function swapAttributes ($el, atr1, atr2) {
    $el.setAttribute(atr1, true)
    $el.removeAttribute(atr2)
  }

  function swapClasses ($el, cx1, cx2) {
    $el.classList.add(cx1)
    $el.classList.remove(cx2)
  }

  function $hamburger () {
    return document.querySelector(toAttribute(hamburgerAttribute))
  }

  function $menu () {
    return document.querySelector(toAttribute(mobileMenuAttribute))
  }

  function toAttribute (attr) {
    return '[' + attr + ']'
  }

  return {
    addListener: addListener
  }
}())
