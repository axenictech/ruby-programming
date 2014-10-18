class StudentsController < ApplicationController

	def student
		@student=Student.new
		@students=Student.all
	end

	def student_save

		 @student=Student.create(data_save)
		 redirect_to students_student_path
     end

     def student_edit
     	@student=Student.find(params[:format])

     end

     def student_update
     	@student=Student.find(params[:id])

     	if @student.update(data_save)
     		redirect_to students_student_path
     	else
     		render 'student_edit'
     	end
     end

     def student_delete
     	@student=Student.find(params[:format])
     	@student.destroy
     	redirect_to students_student_path
     end

      private 
      def data_save
       params.fetch(:student,{}).permit(:rollno,:name)
	  end

end
