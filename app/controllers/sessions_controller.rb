class SessionsController < ApplicationController
          # users can log in
          get '/login' do
              erb :'users/login'
          end

         post '/login' do
            if params["username"].empty? || params["password"].empty?
                @error = "Hey! Who Are You!?"
                erb :'users/login'
            else
               if user = User.find_by(username: params["username"], password: params["password"])
                     session[:user_id] = user.id
                     redirect '/places'
               else
                   @error = "No Pizza Here"
                   erb :'users/login'
               end
            end
         end
    
          # users can log out


         get '/logout' do
           session.clear
           redirect '/'
          end

end