require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./models/item.rb')
require_relative('./models/manufacturer.rb')
also_reload('./models/*')

get '/stock' do # index
  @item = Item.all()
  erb(:index)
end

get '/stock/new' do # new
  erb(:new)
end

get '/stock/:id' do # show
  @item = Item.find(params[:id])
  erb(:show)
end

post '/stock' do # create
  @item = Item.new(params)
  @item.save()
  erb(:create)
end

get '/stock/:id/edit' do # edit
  @item = Item.find(params[:id])
  erb(:edit)
end

post '/stock/:id' do # update
  Item.new(params).update
  redirect to '/stock'
end

post '/stock/:id/delete' do # delete
  @item = Item.find(params[:id])
  @item.delete()
  redirect to '/stock'
end
