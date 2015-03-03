class ListsController < ApplicationController 
  def index
    @list = List.all
  end

  def new
    @list = List.new
  end

  def create
    list = List.create!(name: params["name"])
    binding.pry
    redirect_to specific_list_path(list)
  end

  def show
    @list = List.find(params["id"])
  end

  # def edit
  #   @list = List.find(params["id"])
  # end

  # def update
  #   @list = List.find(params["id"])
  #   if @list.update(name: params["name"])
  #     redirect_to specific_list_path(@list)
  #   else
  #     render :edit
  #   end
  # end

end