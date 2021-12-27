class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/bakeries' do 
    # get all the bakeries from the database
    bakeries = Bakery.all 
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do 
    bakery = Bakery.find(params[:id])
    bakery.to_json(only: [:id, :name], include: { baked_goods:  { only: [:name, :price ] }
    })
  end

  get '/baked_goods/by_price' do 
    baked = BakedGood.all
    baked.order("price DESC").to_json
  end

  get '/baked_goods/most_expensive' do 
    baked = BakedGood.all 
    baked.order(:price).last.to_json
  end

end
