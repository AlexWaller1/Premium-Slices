class UsersController < ApplicationController

   
    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
       
        user = User.new(params)
        if user.save
            session[:user_id] = user.id
            redirect '/places'
        else
            @error = "Sorry, we need more information, or this may be a preexisting account."
            erb :'/users/signup'
        end
    end

    
    

end