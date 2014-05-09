  require 'sinatra'
require './boot.rb'
require './money_calculator'

# ROUTES FOR ADMIN SECTION
get '/admin' do
  @products = Item.all
  erb :admin_index
end

get '/new_product' do
  @product = Item.new
  erb :product_form
end

post '/create_product' do
	@item = Item.new
	@item.name = params[:name]
	@item.price = params[:price]
	@item.quantity = params[:quantity]
	@item.sold = 0
	@item.save
 	redirect to '/admin'
end

get '/edit_product/:id' do
  @product = Item.find(params[:id])
  erb :product_form
end

post '/update_product/:id' do
  @product = Item.find(params[:id])
  @product.update_attributes!(
    name: params[:name],
    price: params[:price],
    quantity: params[:quantity],
  )
  redirect to '/admin'
end

get '/delete_product/:id' do
  @product = Item.find(params[:id])
  @product.destroy!
  redirect to '/admin'
end
# ROUTES FOR ADMIN SECTION
#my code
get '/' do
  @products = Item.all
  erb :home
end

get '/about' do
  erb :about
end

get '/product' do
  @products = Item.all
  erb :product
end

get '/purchase/:id' do
  @product = Item.find(params[:id])
  erb :purchase_form
end

post '/result/:id' do
  @product = Item.find(params[:id])
  @cost = params[:amount].to_i * @product.price
  @money = MoneyCalculator.new(params[:ones].to_i, params[:fives].to_i, params[:tens].to_i, params[:twenties].to_i, params[:fifties].to_i, params[:hundreds].to_i, params[:five_hundreds].to_i, params[:thousands].to_i)
  if params[:amount].to_i>0
    if @money.total >= @cost 
      if @product.quantity.to_i >= params[:amount].to_i
        @hash = @money.change(@cost)
        new_quantity = @product.quantity - params[:amount].to_i
        new_sold = @product.sold + params[:amount].to_i
        @product.update_attributes!(
        quantity: new_quantity,
        sold: new_sold
        )
        erb :result_true
      else
        erb :result_false_quantity
    end
  else
    erb :result_false_money
  end
else
    erb :result_false_amount
end
end
