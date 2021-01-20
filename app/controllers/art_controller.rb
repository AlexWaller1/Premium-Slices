class ArtController < ApplicationController

   



 get '/art' do
    if logged_in?
    
        
        erb :'art/index'
    else
        redirect '/login'
       end
    end

 end