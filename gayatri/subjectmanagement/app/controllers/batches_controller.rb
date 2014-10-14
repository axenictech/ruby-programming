class BatchesController < ApplicationController
  def index
  	@batches = Batch.all
  end

  def new
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
private 
def batch_params
	params.require(:batch).permit!
end
end
