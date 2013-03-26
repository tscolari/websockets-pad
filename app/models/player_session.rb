class PlayerSession
  def initialize(session)
    @session   = session
    @user_data = load_or_create(session[:player]) if session[:player]
  end


  def logged_in?
    !! @user_data
  end

  def name
    @user_data[:name]
  end

  def channel_name
    @user_data[:channel]
  end

  def create(name)
    @session[:player]  = name
    @user_data = load_or_create(name)
  end

  def destroy
    Rails.cache.delete("user_#{name.parameterize}")
    @session[:player]  = nil
  end

  private

  def load_or_create(name)
    Rails.cache.fetch("user_#{name.parameterize}") do
      {
        name: name,
        channel: SecureRandom.uuid
      }
    end
  end

end
