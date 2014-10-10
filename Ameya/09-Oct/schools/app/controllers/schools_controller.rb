class SchoolsController < ApplicationController
  def index
  	@schools=School.all #all contents from DB to variable '@schools' {also where & order clause}
  end

  def new
  	@school=School.new
  end

  def create
  	@school=School.new(schools_params)

  	if @school.save #for validation checking for 'not null'
  		redirect_to school_path(@school) #data stored to DB n page navigated to 'show web page'
  	else
  		render 'new'
  	end
  end

  def show
  	@school=School.find(params[:id]) #id is default
  end

  def edit
  	@school=School.find(params[:id]) #id is default
  end

  def update
  	@school=School.find(params[:id])
  	
  	if @school.update(schools_params) #for validation checking for 'not null'
  		redirect_to schools_path(@school) #data stored to DB n page navigated to 'show web page'
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@school=School.find(params[:id])
  	@school.destroy

  	redirect_to schools_path
  end

  private
  	def schools_params
  		params.require(:school).permit(:school_name,:school_address) #DB table name
  	end
end