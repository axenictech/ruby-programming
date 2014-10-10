class PeoplesController < ApplicationController
  def new
  	@people=People.new
  	#p @people
  end

  def create 
  	@people=People.new(params_people)

  	if @people.save
  		redirect_to people_path(@people)
  	else render 'new'
  	end
  end

  def show
  	@people=People.find(params[:id])
  end

  

  def index
  	@people=People.all
  end

  def edit
  	@people=People.find(params[:id])
  end

  def update
  	@people=People.find(params[:id])

  	if @people.update(params_people)
  		redirect_to people_path(@people)
  	else 
  		render 'edit'
  	end
  end

  def destroy
  	@people=People.find (params[:id])

  	@people.destroy
  	redirect_to people_path(@people)
  end

  private 
  def params_people
  	params.require(:people).permit(:firstname,:lastname,:age,:bloodGroup,:address,:email,:nationality,:country,:phoneNo)
  end
 end
