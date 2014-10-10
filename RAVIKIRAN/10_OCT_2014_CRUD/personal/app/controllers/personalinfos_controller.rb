class PersonalinfosController < ApplicationController
  def index
  	@pers=Personalinfo.all
  end

  def new
  	@per=Personalinfo.new
  end

  def show
  	@per = Personalinfo.find(params[:id])
  end

  def create
 	@per = Personalinfo.new(pdetails)
 	if @per.save
  		redirect_to personalinfos_path(@per)
  	else
  		render 'new'
  	end
  end
 
  def edit
  	@per = Personalinfo.find(params[:id])
  end

  def update
  	@per = Personalinfo.find(params[:id])
  	if @per.update(pdetails)
  		redirect_to personalinfos_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@per = Personalinfo.find(params[:id])
  	@per.destroy
  	redirect_to personalinfos_path
  end

  private
  	def pdetails
  		params.require(:personalinfo).permit(:first_nanme,:last_name,:address,:age,:email,:mobile,:bloodgroup,:country)
  	end

end
