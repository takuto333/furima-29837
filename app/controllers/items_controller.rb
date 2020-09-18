class ItemsController < ApplicationController
  def index
  end

  def new
    
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end

  private

  def item_params
    params.permit(:image, :name, :description, :category_id, :condition_id, :shipping_charges_id, :shipping_area_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

end