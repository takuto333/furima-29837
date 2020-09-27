class OrdersController < ApplicationController

  def index
    @order = OrderAddress.new
  end

  def create
    # binding.pry
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.permit(:token, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id) 
  end


  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
end