var Hamburger = (function () {

  var hamburgerAttribute  = '[hamburger]'
  var mobileMenuAttribute = '[mobile-nav]'
  var openClass    = 'open'
  var closedClass  = 'closed'
  var displayBlock = 'db'
  var displayNone  = 'dn'

  function addListener () {
    getHamburger().addEventListener('click', toggle)
  }

  function toggle () {
    return isOpen()
      ? close()
      : open()
  }

  function isOpen () {
    return getHamburger().classList.contains(openClass)
  }

  function open () {
    var $hb = getHamburger()
    var $mn = getMenu()

    $hb.classList.add(openClass)
    $hb.classList.remove(closedClass)

    $mn.classList.add(displayBlock)
    $mn.classList.remove(displayNone)
  }

  function close () {
    var $hb = getHamburger()
    var $mn = getMenu()

    $hb.classList.add(closedClass)
    $hb.classList.remove(openClass)

    $mn.classList.add(displayNone)
    $mn.classList.remove(displayBlock)
  }

  function getHamburger () {
    return document.querySelector(hamburgerAttribute)
  }

  function getMenu () {
    return document.querySelector(mobileMenuAttribute)
  }

  return { addListener: addListener }
}())
