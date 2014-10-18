class PersonalinfosController < ApplicationController
  def index
  	@emps=Personalinfo.all #all contents from DB to variable '@emps' {also where & order clause}
  end

  def new
  	@emp=Personalinfo.new #create object of 'model'
  end

  def create
  	@emp=Personalinfo.new(employees_params)

  	if @emp.save #for validation checking for 'not null'
  		redirect_to personalinfo_path(@emp) #data stored to DB n page navigated to 'show web page'
  	else
  		render 'new'
  	end
  end

  def show
  	@emp=Personalinfo.find(params[:id]) #id is default
  end

  def edit
  	@emp=Personalinfo.find(params[:id]) #id is default
  end

  def update
  	@emp=Personalinfo.find(params[:id])
  	
  	if @emp.update(employees_params) #for validation checking for 'not null'
  		redirect_to personalinfos_path #data stored to DB n page navigated to 'show web page'
  	else
  		render 'new'
  	end
  end

  def destroy
  	@emp=Personalinfo.find(params[:id])
  	@emp.destroy

  	redirect_to personalinfos_path
  end

  private
  	def employees_params
  		params.require(:personalinfo).permit(:first_name,:last_name,:address,:age,:ph_no,:email,:blood_group,:country) #DB table name
  	end
end
