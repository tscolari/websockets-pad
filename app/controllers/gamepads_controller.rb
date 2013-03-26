class GamepadsController < ApplicationController
  before_filter :require_player!
  def show
    @player = PlayerSession.new(session[:player])
  end


end
