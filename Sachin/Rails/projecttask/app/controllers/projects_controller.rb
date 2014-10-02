class ProjectsController < ApplicationController
  def index
  	@projects=Project.all
  end
  def new
  		@project=Project.new
  		@projects=Project.all
  end
  def create

  	@project=Project.create(project_param)
 
  	redirect_to project_path(@project)
	end

	def show
  		
  		@project = Project.find(params[:id])

  	end

  	def edit

  		@project = Project.find(params[:id])
  		
  	end

  	def update
  		@project=Project.find(params[:id])
  		@project.update(project_param)
  		redirect_to projects_path
  		
  	end
  	def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end
private
def project_param
	params.require(:project).permit(:name, :task)	
end
end
