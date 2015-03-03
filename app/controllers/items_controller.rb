class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item_params = params["item"]
    @item = Item.create(description: item_params["description"])
    if @item.save
      flash[:notice] = "Item created successfully!"
      redirect_to specific_item_path(@item)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params["id"])
  end



end
