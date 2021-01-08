# TODO
* create migrations
* create models with relationships
* plan out routes for controller following restful conventions and map to CRUD actions
* build controller actions and views simulataneously
* adding user authentication
* add user authorization
* build views (forms)
* build navigation
* validations

 * patch '/places/:id' do
       * @place = Place.find(params["id"])
       * if !place.title.empty? && !place.description.empty?
       * place.update
       * redirect '/places'
       
    * else
        * @error = "Hey! Give us more information!"
        * erb :'places/edit'
    * end
    * place.update(title: params["title"], address: params["address"], description: params["description"], image: params["image"])
* end

*this works if edit page fails again


   