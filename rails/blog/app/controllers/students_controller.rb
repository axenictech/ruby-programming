class StudentsController < ApplicationController
	def index
	@student=Student.new
	end
	def create
		@student=Student.new(get_params)
		@student.save
		@student=Student.all
	end
	def edit
		@student=Student.find(params[:id])
	end
	def update
			@student=Student.find(params[:id])
			@student.update(get_params)

			redirect_to student_path
	end
	def show
		@student=Student.all
	end
	def destroy
		@student=Student.find(params[:id])
		@student.delete
		redirect_to student_path
	end

	private 
	def get_params
		params.require(:student).permit(:age, :roll, :marks)
	end
end
