class BatchesController < ApplicationController
  def index
  	
  end

  def new
    @batches = Batch.all
  	@batch = Batch.new
  end

  def create
  	
  	@batch  = Batch.new(batch_params)
     if @batch.save
        @batches = Batch.all 
     else 
        render 'new'
     end
  end

  def show
    @batch = Batch.find(params[:id])
  end

  def edit
    @batch = Batch.find(params[:id])
  end

  def update
    @batch=Batch.find(params[:id])
    if @batch.update(batch_params)
      @batches = Batch.all
    else 
      render 'edit'
    end
  end

  def destroy
    @batch=Batch.find(params[:id])
    @batch.destroy
    redirect_to new_batch_path(@batch)
  end

private 
def batch_params
	params.require(:batch).permit!
end
end
