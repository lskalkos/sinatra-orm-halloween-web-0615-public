class KidsController < HalloweenController
  get '/kids' do
    @kids = Kid.all

    erb :'kids/index'
  end

  get '/kids/new' do

    erb :'kids/new'
  end

  get '/kids/:id' do
    @kid = Kid.find(params[:id])

    erb :"kids/show"
  end

  post '/kids' do
    @kid = Kid.new(params[:kid])
    @kid.bucket = Bucket.new
    @kid.save


    redirect "/kids/#{@kid.id}"
  end

  patch '/kids/:id/pig-out' do

    @kid = Kid.find(params[:id])
    amount = params[:consumption].to_i
    @kid.pig_out(amount)

    redirect "/kids/#{@kid.id}"
  end

end