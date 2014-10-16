class SubjectsController < ApplicationController
  def index
   
   # @batch = Batch.find(params[:batch_id])
   # @subjects =@batch.subject.all 
   
  end

  def new
  	@subject = Subject.new
    @batch = Batch.find(params[:batch_id])
    @subjects =@batch.subjects.all 
  end

  def create 
    @batch = Batch.find(params[:batch_id])
    @batch.subjects.create(subject_params)
    @subjects =@batch.subjects.all 
  end

  def show
     @batch = Batch.find(params[:id])
 
  end

  def edit
  
    @subject = Subject.find(params[:id])

  end 

  def update
    
    @subject = Subject.find(params[:id])
    @batch = @subject.batch
    if @subject.update(subject_params)
      redirect_to new_batch_subject_path(@batch)
    else
      render 'edit'
    end
  end 

  def destroy
    
    @subject= Subject.find(params[:id])
    @batch = @subject.batch
    @subject.destroy 
    redirect_to new_batch_subject_path(@batch)
   
   
  end

  private
  def subject_params
  	params.require(:subject).permit!
  end


end
