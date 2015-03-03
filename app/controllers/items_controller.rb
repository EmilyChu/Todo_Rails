class ItemsController < ApplicationController
  before_action :authenticate_user!  

  def index 
    @item = Item.all
  end

  def new
    @list = List.find(params["list_id"])
    @item = Item.new
  end

  def create
    @list = List.find(params["list_id"])
    item_params = params["item"]
    @item = current_user.items.new(description: item_params["description"], due_date: item_params["due_date"], list_id: params["list_id"])
    if @item.save
      flash[:notice] = "Item created successfully!"
      redirect_to specific_item_path(@list, @item)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params["id"])
  end



end
