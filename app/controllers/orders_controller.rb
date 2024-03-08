class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    puts "params[:item_id]: #{params[:item_id]}"
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_form = OrderForm.new
  end

  def new
    @order_form = OrderForm.new
    @item = Item.find(params[:item_id])
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    respond_to do |format|
      format.html { render 'orders/index' }
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Item not found.'
  end

  def create
    @order_form = OrderForm.new(order_form_params)
    @item = Item.find(params[:item_id])
    @order_form.user_id = current_user.id
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path, notice: 'Order placed successfully.'
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Item not found.'
  end

  private

  def order_form_params
    params.require(:order_form).permit(
      :price,
      :postal_code,
      :shipping_from_region_id,
      :city,
      :street_address,
      :building_name,
      :phone_number,
      :item_id,
      :user_id,
    ).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      {
        amount: @item.price,  # 商品の値段
        card: order_form_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      }
    )
  end
end



