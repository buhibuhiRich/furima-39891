class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order_form = OrderForm.new
    @item = Item.find(params[:item_id])

    unless @item.sold_out?
      @order = Order.find_by(item_id: @item.id)
      if user_signed_in? && @item.user == current_user && !@order&.purchased?
        @editable = true
      else
        @editable = false
      end
    end
  
    if @item.sold_out?
      redirect_to root_path
      return
    end
  
   
    if @order&.purchased?
      redirect_to root_path
      return
    end
  
   
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end
  

  def create
    @order_form = OrderForm.new(order_form_params)
    @item = @order_form.item
    
    if sold_out? || current_user == @item.user
      redirect_to root_path
      return
    end
  
    @order_form.user_id = current_user.id
    
    if @order_form.valid?
      order = @order_form.save
      pay_item
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
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
  
  def sold_out?
    @item.sold_out?
  end
end
