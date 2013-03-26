WebsocketRails::EventMap.describe do
  namespace :gamepad do
    # using a Hash to specify the target
    subscribe :move , "websockets/gamepad_socket#move"
  end
end
