class ListsController < ApplicationController 
  # enable :method_override

  def index
    @list = List.all
  end

  def new
    @list = List.new
  end

  def create
    list_params = params["list"]
    @list = List.create!(name: list_params["name"])
    if @list.save
      redirect_to specific_list_path(@list)
    else
      render :new
    end
  end

  def show
    @list = List.find(params["id"])
  end

  def edit
    @list = List.find(params["id"])
  end

  def update
    @list = List.find(params["id"])
    if @list.update(name: params["list"]["name"])
      redirect_to specific_list_path(@list)
    else
      render :edit
    end
  end

end