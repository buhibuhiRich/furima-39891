class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_params)
    @order_form.user = current_user
  
    if @order_form.save
      redirect_to item_path
    else
      render :index, status: :unprocessable_entity
    end
  end
  
  private

  def order_params
    params.require(:order_form).permit(
      :postal_code,
      :shipping_from_region_id,
      :city,
      :street_address,
      :building_name,
      :phone_number
    )
  end
end
