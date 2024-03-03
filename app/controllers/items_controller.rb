class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])

    if !user_signed_in?
      redirect_to new_user_session_path
    elsif @item.user != current_user
      redirect_to root_path
    end
  end


  def update
    @item = Item.find(params[:id])
  
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      puts @item.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end
  
  
  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :category_id, :condition_id, :shipping_cost_responsibility_id, :shipping_from_region_id, :days_until_shipment_id).merge(user_id: current_user.id)
  end

end
