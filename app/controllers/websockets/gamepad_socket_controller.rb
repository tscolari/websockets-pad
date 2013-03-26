module Websockets
  class GamepadSocketController < BaseController
    def move
      @player = PlayerSession.new(session)
      WebsocketRails[@player.channel_name].trigger message_type, {message: "move #{message}"}
    end

    private

    def message_type
      "move_#{message}"
    end
  end
end
