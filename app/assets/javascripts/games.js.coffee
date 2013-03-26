
window.Game = {

  moveUp: (message) ->
    console.log("move up")
    player.animate({
      'top' : "-=30px"
    })

  moveDown: (message) ->
    console.log("move down")
    player.animate({
      'top' : "+=30px"
    })

  moveLeft: (message) ->
    console.log("move left")
    player.animate({
      'left' : "-=30px"
    })

  moveRight: (message) ->
    console.log("move right")
    player.animate({
      'left' : "+=30px"
    })
}

$(document).ready () ->
  window.dispatcher = new WebSocketRails('localhost:3000/websocket')
  window.player     = $('#player')
  window.channel    = dispatcher.subscribe(player.data('channel'))

  channel.bind('move_up'    , (data) -> console.log("move uppp #{data}"))
  channel.bind('move_up'    , Game.moveUp)
  channel.bind('move_down'  , Game.moveDown)
  channel.bind('move_left'  , Game.moveLeft)
  channel.bind('move_right' , Game.moveRight)
  console.log('game loaded')
