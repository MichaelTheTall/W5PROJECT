require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./models/item.rb')
require_relative('./models/manufacturer.rb')
also_reload('./models/*')

get '/stock' do # index
  @stock = Item.all()
  erb(:index)
end

get '/stock/new' do # new
  erb(:new)
end

get '/stock/:id' do # show
  @stock = Item.find(params[:id])
  erb(:show)
end

post '/stock' do # create
  @stock = Item.new(params)
  @stock.save()
  erb(:create)
end

get '/stock/:id/edit' do # edit
  @stock = Item.find(params[:id])
  erb(:edit)
end

post '/stock/:id' do # update
  Item.new(params).update
  redirect to '/stock'
end

post '/stock/:id/delete' do # delete
  stock = Item.find( params[:id] )
  stock.delete()
  redirect to '/stock'
end
