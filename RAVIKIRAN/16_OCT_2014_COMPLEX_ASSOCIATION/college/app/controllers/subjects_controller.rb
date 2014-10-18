class SubjectsController < ApplicationController
  def index
  	@bs=Batch.all
  end
  def subject
    @bs=Batch.all
  end
  def insert_batch
  	@b=Batch.new
  end
  def batch_save
  	@b=Batch.new(bparams)
  	@b.save
  	redirect_to subjects_index_path
  end
  def insert_normal
  	@bs=Batch.all
  end
  def batch_delete
  	@b=Batch.find(params[:format])
  	@b.destroy
  	redirect_to subjects_index_path
  end
  def update_batch
  	@b=Batch.find(params[:format])
  end

  def batch_update
  	@b=Batch.find(params[:id])
    @b.update(bparams)
    @b=Batch.all
    redirect_to subjects_index_path
  end
  private
  def bparams
  	params.require(:batch).permit! 
  end
end
