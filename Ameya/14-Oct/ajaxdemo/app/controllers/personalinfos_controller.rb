class PersonalinfosController < ApplicationController
  def index
  	@pers=Personalinfo.all
  end

  def new
  	@per=Personalinfo.new
  	 	@pers=Personalinfo.all
  end

  def create
  	@per=Personalinfo.create(personal_params)
  	@pers=Personalinfo.all
  end

  def edit
  	@per=Personalinfo.find(params[:id])
  end

  def update
  	@per=Personalinfo.find(params[:id])
  	@per.update(personal_params)
  	@pers=Personalinfo.all
  end

  def destroy
  	@per=Personalinfo.find(params[:id])
  	@per.destroy
  	@pers=Personalinfo.all
  end

  private
  	def personal_params
  		params.require(:personalinfo).permit!
  	end
end
