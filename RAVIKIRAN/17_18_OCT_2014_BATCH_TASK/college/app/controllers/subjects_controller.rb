class SubjectsController < ApplicationController
  def index
  	@bs=Batch.all
  end

  def showne
    @b = Batch.find(params[:batch][:id])
    @ns=Normal.where(batch_id:@b.id)
    @es=Elective.where(batch_id:@b.id)
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
    @a=Batch.find(params[:format])
    @n=Normal.new
  end
  def insert_elective
    @a=Batch.find(params[:format])
    @e=Elective.new
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
    redirect_to subjects_index_path
  end
  def normal_save
    @b = Batch.find(params[:format])
    @b.normal.create(nparams)
    redirect_to subjects_subject_path   
  end
  def elective_save
    @b = Batch.find(params[:format])
    @b.elective.create(eparams)
    redirect_to subjects_subject_path   
  end
  def normal_delete
    @n = Normal.find(params[:format])
    @n.destroy
    redirect_to subjects_subject_path   
  end

  def update_normal
    @n=Normal.find(params[:format])
  end

  def normal_update
    @n=Normal.find(params[:id])
    @n.update(nparams)
    redirect_to subjects_subject_path   
  end
  def elective_delete
    @e = Elective.find(params[:format])
    @e.destroy
    redirect_to subjects_subject_path   
  end

  def update_elective
    @e=Elective.find(params[:format])
  end

  def elective_update
    @e=Elective.find(params[:id])
    @e.update(eparams)
    redirect_to subjects_subject_path   
  end
  private
  def bparams
  	params.require(:batch).permit! 
  end
  def nparams
    params.require(:normal).permit! 
  end
  def eparams
    params.require(:elective).permit! 
  end
end
