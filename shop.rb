require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('./models/item.rb')
require_relative('./models/manufacturer.rb')

get '/' do
  redirect to '/home'
end

get '/home' do
  erb(:home)
end

get '/support' do
  erb(:support)
end

get '/about' do
  erb(:about)
end

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
  redirect to '/stock'
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

get '/manu' do
  @man = Manufacturer.all()
  erb(:index_m)
end

get '/manu/new' do
  erb(:new_m)
end

get '/manu/:id' do
  @man = Manufacturer.find(params[:id])
  erb(:show_m)
end

get '/manu/:id/items' do
  @man = Manufacturer.find(params[:id])
  erb(:list_m)
end

post '/manu' do
  @man = Manufacturer.new(params)
  @man.save()
  redirect to '/manu'
end

get '/manu/:id/edit' do
  @man = Manufacturer.find(params[:id])
  erb(:edit_m)
end

post '/manu/:id' do
  Manufacturer.new(params).update
  redirect to '/manu'
end

post '/manu/:id/delete' do
  @man = Manufacturer.find(params[:id])
  @man.delete()
  redirect to '/manu'
end
