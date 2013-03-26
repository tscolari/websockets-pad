window.Gamepad = {
  
  up: () ->
    console.log("move up")
    dispatcher.trigger('gamepad.move', 'up')

  down: () ->
    console.log("move down")
    dispatcher.trigger('gamepad.move', 'down')

  right: () ->
    console.log("move right")
    dispatcher.trigger('gamepad.move', 'right')

  left: () ->
    console.log("move left")
    dispatcher.trigger('gamepad.move', 'left')
}

$(document).ready () ->
  window.dispatcher = new WebSocketRails('localhost:3000/websocket')
  window.gamepad    = $('#gamepad')
  $('#up').on('click', Gamepad.up)
  $('#down').on('click', Gamepad.down)
  $('#left').on('click', Gamepad.left)
  $('#right').on('click', Gamepad.right)
  console.log('gamepad loaded')
