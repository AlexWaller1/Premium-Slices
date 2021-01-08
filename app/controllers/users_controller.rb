class UsersController < ApplicationController

    #users can sign up
    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        # users should not be able to create an account with any blank credentials
        # users should not be able to create an account with a username that already exists
        user = User.new(params)
        if user.username.empty? || user.password.empty?
            @error = "Hey! Who Are You!?"
            erb :'users/signup'
        elsif User.find_by(username: user.username)
            @error = "That's a Preexisting Account"
            erb :'users/signup'
        else
            user.save
            session[:user_id] = user.id
            redirect '/places'
        end
    end

    #users can delete account
    

end