class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def require_player!
    unless player
      session[:redirect_url] = "#{request.protocol}#{request.host_with_port}#{request.fullpath}"
      redirect_to new_player_sessions_path
    end
  end
  
  def player
    session[:player]
  end
  helper_method :player

end
