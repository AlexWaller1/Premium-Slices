class ArtController < ApplicationController

    #get '/art/new' do
    #if logged_in?
        #erb :'/art/new'
    #else
        #redirect '/login'
   #end
#end

#post '/art' do
    #art = current_pizza.places.build(params)
     #if !place.title.empty? && !place.description.empty?
         #place.save
         #redirect '/art'
     #else
         #@error = "Hey! Give us more information!"
         #erb :'art/new'
     #end
 #end

 #get '/art' do
    #if logged_in?
    
       # @places = Place.all.reverse
       # erb :'art/index'
   # else
        #redirect '/login'
    #end
#end

#get '/places/:id' do
    #if logged_in?
        #@place = Place.find(params["id"])
        #erb :'places/show'
    #else
        #redirect '/login'
    #end
#end

end