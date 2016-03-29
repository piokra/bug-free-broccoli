sizes = {}
toggleFullscreen = (elem, callback = (e) -> ) ->
  name = "#{elem}"

  cond = (document.fullScreenElement?) or
    (document.msFullscreenElement?) or
    (document.mozFullScreen?) or
    (document.webkitIsFullScreen?)
  if cond
    sizes[elem] = elem.width;
    sizes[elem] = elem.height;
    if elem.requestFullScreen
      elem.requestFullScreen()
    if elem.mozRequestFullScreen
      elem.mozRequestFullScreen()
    if elem.webkitRequestFullScreen
      elem.webkitRequestFullScreen()
    if elem.msRequestFullscreen
      elem.msRequestfullscreen()
    elem.style.width = "100vw"
    elem.style.height = "100vh"
    elem.style.padding = "40px 15px"
    console.log "#{elem.style.width} , #{elem.style.height}"
    console.log elem
window["toggleFullscreen"] = toggleFullscreen
