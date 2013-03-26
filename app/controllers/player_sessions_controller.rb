class PlayerSessionsController < ApplicationController

  def new

  end

  def create
    @player = PlayerSession.new(session)
    @player.create(params[:player])
    redirect_url = session[:redirect_url]
    session[:redirect_url] = nil
    redirect_to redirect_url
  end

  def destroy
    current_player.destroy
    redirect_to root_path
  end

end
