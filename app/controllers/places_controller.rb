class PlacesController < ApplicationController
    
    #Create Pizza Place

    #New
    # make a get request to '/places/new'
    get '/places/new' do
        if logged_in?
            erb :'/places/new'
        else
            redirect '/login'
    end
end
    
    # Create
    # make a post request to '/places'
    post '/places' do
       place = current_pizza.places.build(params)
        if !place.title.empty? && !place.description.empty?
            place.save
            redirect '/places'
        else
            @error = "Hey! Give us more information!"
            erb :'places/new'
        end
    end

    #Read Pizza Place
   
    #index
    # make a get request to '/pizzaplaces'

    get '/places' do
        if logged_in?
        
            @places = Place.all.reverse
            erb :'places/index'
        else
            redirect '/login'
        end
    end

    #show
    # make a get request to '/pizzaplaces/:id'

    get '/places/:id' do
        if logged_in?
            @place = Place.find(params["id"])
            erb :'places/show'
        else
            redirect '/login'
        end
    end

    #Update Pizza Place

    # Edit
    # make a get request to '/pizzaplaces/:id/edit'
    get '/places/:id/edit' do
        if logged_in?
        @place = Place.find(params["id"])
        erb :'/places/edit'
        else
            redirect '/login'
        end
    end

    # Update
    # make a patch request to '/places/:id'
    patch '/places/:id' do
        #may take out @ symbols later
       @place = Place.find(params["id"])
       if !params["place"]["title"].empty? && !params["place"]["description"].empty?
       @place.update(params["place"])
       redirect "/places/#{params["id"]}"
       else
        @error = "Hey! Give us more information!"
        erb :'places/edit'
    end
    #place.update(title: params["title"], address: params["address"], description: params["description"], image: params["image"])
end



    #Destroy Pizza Place

    # make a delete request to '/places/:id'
    delete '/places/:id' do
        place = Place.find(params[:id])
        place.destroy
        redirect '/places'
    end
end

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



