class ProjectsController < ApplicationController
  def index
  end
  def new
  		@project=Project.new
  		@projects=Project.all
  end
  def create
  	@projects=Project.all
  @project = Project.new(project_param)
 
  @project.save
  redirect_to project_path
end

private
def project_param
	params.require(:project).permit(:name, :task)	
end	
end
