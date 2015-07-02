class HousesController < HalloweenController
  get '/houses' do
    @houses = House.all

    erb :'houses/index'
  end

  post '/houses' do
    @house = House.create(params[:house])

    redirect "/houses/#{@house.id}"
  end

  get '/houses/new' do

    erb :'houses/new'
  end

  get '/houses/:id' do
    @house = House.find(params[:id])
    @kids = Kid.all

    erb :'houses/show'
  end

  patch '/houses/:id/trick-or-treat' do
    @house = House.find(params[:id])
    @kid = Kid.find(params[:kid_id])

    @house.give_candy(@kid)
    @house.save

    redirect "/houses/#{@house.id}"
  end

  patch '/houses/:id' do
    @house = House.find(params[:id])
    @house.update(params[:house])

    redirect "/houses/#{@house.id}"
  end

end