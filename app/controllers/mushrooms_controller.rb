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
  
  def index
	@title = "All Mushrooms"
	@mushrooms = Mushroom.paginate(:page => params[:page])
  end
  
  def search
	
	star = "%"
	@name = star + params[:name] + star
	@color = star + params[:color] + star
	@type = star + params[:type] + star
	@poisonous = params[:poisonous]
    
	@mushrooms = Mushroom.find(:all, :conditions => [ "name LIKE ? or color like ? or mushroom_type like ? or poisonous = ?", @name, @color, @type, @poisonous])
	
	
	respond_to do |format|
		format.html
		format.json { render :json => @mushrooms }
	end
  end

end
