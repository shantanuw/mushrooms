class MushroomsController < ApplicationController
  def new
	@title = "Add New Mushroom"
	@mushroom = Mushroom.new
  end
  
  def show
    @mushroom = Mushroom.find(params[:id])
	@title = @mushroom.name
  end
  
  def create
    @mushroom = Mushroom.new(params[:mushroom])
    if @mushroom.save
      redirect_to @mushroom
    else
      @title = "Add New Mushroom"
      render 'new'
    end
  end

end
