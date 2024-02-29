class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
  
    if @item.save
      redirect_to root_path
    else    
      puts @item.errors.full_messages 
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @items = Item.order(created_at: :desc)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :category_id, :condition_id, :shipping_cost_responsibility_id, :shipping_from_region_id, :days_until_shipment_id)
  end
end
