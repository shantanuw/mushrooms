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
	query = ""
	
	@name = params[:name]
	if @name != nil && !@name.empty?
		query = query + "name LIKE '" + star + @name + star + "'"	
	end
	
	@color = params[:color]
	if @color != nil && !@color.empty?
		if query != ""
			query = query + "and color LIKE '" + star + @color + star + "'"
		else 
			query = query + "color LIKE '" + star + @color + star + "'"
		end
	end
	
	@type = params[:type]
	if @type != nil && !@type.empty?
		if query != ""
			query = query + "and mushroom_type LIKE '" + star + @type + star + "'"
		else 
			query = query + "mushroom_type LIKE '" + star + @type + star + "'"
		end
	end
	
	@poisonous = params[:poisonous]
	if @poisonous != nil && !@poisonous.empty?
		if query != ""
			query = query + "and poisonous = '" + @poisonous + "'"
		else 
			query = query + "poisonous = '" + @poisonous + "'"
		end
	end
	
	@mushrooms = Mushroom.where(query)
	
	
	respond_to do |format|
		format.html
		format.json { render :json => @mushrooms }
	end
  end

end
