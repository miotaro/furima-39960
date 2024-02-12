class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, except: :index
  before_action :move_to_signin
  before_action :move_to_page

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipalities, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])  end

  def move_to_signin
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_to_page
    if current_user.id == @item.user_id
      redirect_to root_path
    end
    if @item.present?
      redirect_to root_path
    end
  end
  
end
