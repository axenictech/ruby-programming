class WelcomesController < ApplicationController
  def index

  	
  end

  def new
  	@welcome=Student.new
  	
  end

  def create
  	@welcome=Student.new(stud_details)
  	@welcome.save
  	redirect_to welcomes_path(@welcome)
  	
  end

  private
  def stud_details
  	params.require(:student).permit(:s_name,:s_age)
  end
end
