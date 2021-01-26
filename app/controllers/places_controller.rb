class PlacesController < ApplicationController
    
    
    get '/places/new' do
        logged_in? ? (erb :'/places/new') : (redirect '/login')
        #if logged_in?
            #erb :'/places/new'
       # else
            #edirect '/login'
        #end
    end
    
    
    post '/places' do
       place = current_user.places.build(params)
        if place.save
            
            redirect '/places'
        else
            @error = "Hey! Give us more information!"
            erb :'places/new'
        end
    end

    
    get '/places' do
        if logged_in?
        
            @places = Place.all.reverse
            erb :'places/index'
        else
            redirect '/login'
        end
    end

   

    get '/places/:id' do
        if logged_in?
            @place = Place.find_by(id: params["id"])
            if @place
             erb :'places/show'
            else
                redirect '/places'
            end
        else
            redirect '/login'
        end
    end

   
    get '/places/:id/edit' do
        
            
        @place = Place.find(params["id"]) 
        if current_user == @place.user 
          
          erb :'/places/edit'
         
         
        else
            redirect '/places'
        end
    end

   
    patch '/places/:id' do
       
       @place = Place.find(params["id"])
       
        if current_user == @place.user
         if @place.update(params["place"])
         redirect "/places/#{params["id"]}"
         else
            @error = "Hey! Give us more information!"
            erb :'places/edit'
         end
       else
       redirect '/places'
       end
   
    end



    
    delete '/places/:id' do
        
        
        place = Place.find(params[:id])
        if current_user == place.user
        place.destroy
        redirect '/places'

        else
        redirect '/places/:id'
        
         end
      end

      private

      def place_params
        params.require(:place).permit(:description, :address, :title, :image)
      end
    
    end

#