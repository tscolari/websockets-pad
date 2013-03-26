class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def require_player!
    unless current_player.logged_in?
      session[:redirect_url] = "#{request.protocol}#{request.host_with_port}#{request.fullpath}"
      redirect_to new_player_sessions_path
    end
  end

  def current_player
    @player ||= PlayerSession.new(session)
  end
  helper_method :current_player

end
