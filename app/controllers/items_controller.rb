class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect_root, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    
    @item.destroy
    redirect_to root_path(@item)
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)

    else
      render :edit
    end
  end

  private

  def redirect_root
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :text, :image, :category_id, :status_id, :shipping_id, :shipping_area_id,
                                 :shipdate_id, :price).merge(user_id: current_user.id)
  end
end
