class DetailsController < ApplicationController
  def index
  	@detail=Detail.all
  end

  def new 
  	@detail=Detail.new
  end

 def create 
  	@detail=Detail.new(params_detail)

  	if @detail.save
  		redirect_to detail_path(@detail)
  	else render 'new'
  	end
  end

  def show
  	@detail=Detail.find(params[:id])

  end

  def edit
  	@detail=Detail.find(params[:id])
  end

  def update
  	@detail=Detail.find(params[:id])

  	if @detail.update(params_detail)
  		redirect_to detail_path(@detail)
  	else 
  		render 'edit'
  	end
  end

  def destroy
  	@detail=Detail.find (params[:id])

  	@detail.destroy
  	redirect_to details_path
  end

  private 
  def params_detail
  	params.require(:detail).permit(:firstname,:lastname,:age,:bloodGroup,:address,:email,:nationality,:country,:phoneNo)
  end
 end
