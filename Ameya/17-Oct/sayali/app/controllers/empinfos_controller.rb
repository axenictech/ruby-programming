class EmpinfosController < ApplicationController
  def index
  	@pers=Empinfo.all
  end

  def create
  	@per=Empinfo.create(emp_params)
  	@pers=Empinfo.all
    redirect_to empinfo_path(@per)
  end

  def new
  	@per=Empinfo.new
  	#@pers=Empinfo.all
  end

  def show
    @per=Empinfo.all
  end

  private
  	def emp_params
  		params.require(:empinfo).permit!
  	end
end
