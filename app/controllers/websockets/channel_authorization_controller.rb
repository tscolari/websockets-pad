module Websockets
  class ChannelAuthorizationController < BaseController

    def authorize_channel
      if session[:player]
        @player = PlayerSession.new(session)
        if @player.channel_name == message[:channel]
          return accept_channel @player
        end
      end
      deny_channel({ message: 'authorization failed!'})
    end

  end
end
