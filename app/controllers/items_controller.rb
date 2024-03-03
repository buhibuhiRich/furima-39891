class ItemsController < ApplicationController
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
      @item.user != current_user
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

  def set_item
    @item = Item.find(params[:id])
  end
