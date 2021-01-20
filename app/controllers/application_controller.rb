require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "whatever"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

not_found do
  redirect '/places'
end

  get "/" do
    erb :welcome
  end

  def logged_in?
    !!current_pizza
  end

  def current_pizza
    User.find_by(id: session[:user_id])
  end
  

end
