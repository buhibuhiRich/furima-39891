class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_form = OrderForm.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @order_form = OrderForm.new(order_form_params)
    @item = Item.find(params[:item_id])
    @order_form.user_id = current_user.id
  
    if @order_form.valid?
 
      order = @order_form.save
      pay_item
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
  

  private

  def order_form_params
    params.require(:order_form)
          .permit(
            :postal_code,
            :shipping_from_region_id,
            :city,
            :street_address,
            :building_name,
            :phone_number
          )
          .merge(
            item_id: params[:item_id],
            user_id: current_user.id,
            token: params[:token]
          )
  end
  
  
  def pay_item
   
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      {
        amount: @item.price,
        card: order_form_params[:token],
        currency: 'jpy'
      }
    )
  end
end
