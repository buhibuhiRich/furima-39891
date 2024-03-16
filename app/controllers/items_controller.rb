class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
    unless @item.sold_out?
      render :show
      return
    end
    @order = Order.find_by(item_id: @item.id)
    if user_signed_in? && @item.user == current_user && !@order&.purchased?
      @editable = true
    else
      @editable = false
    end
  end

  def edit
    unless current_user == @item.user && !@item.sold_out? && !@item.order&.purchased?
      redirect_to root_path
    end
  end
  
  
  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.user == current_user
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end  


  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :category_id, :condition_id, :shipping_cost_responsibility_id, :shipping_from_region_id, :days_until_shipment_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
