module Websockets
  class GamepadSocketController < BaseController
    def move
      # send_message message_type, session[:player] , :namespace => :game
      @player = PlayerSession.new(session[:player])
      WebsocketRails[@player.channel_name].trigger message_type, {message: "move #{message}"}
    end

    private

    def message_type
      "move_#{message}"
    end
  end
end
