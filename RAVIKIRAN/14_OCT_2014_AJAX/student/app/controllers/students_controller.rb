class StudentsController < ApplicationController
  def stud_insert_form
  	@s=Mark.new
  end

  def student_save
  	@s=Mark.new(sparams)
  	@s.save
  	redirect_to students_start_path
  end

  def stud_show_form
  	@ss=Mark.all
  end

  def stud_update_form
  	@s=Mark.find(params[:format])
  end

  def student_update
  	@s=Mark.find (params[:id])
    @s.update(sparams)
    @s=Mark.all
    redirect_to students_start_path
  end
  def student_delete
  	@s=Mark.find(params[:format])
  	@s.destroy
  	redirect_to students_start_path
  end
  private
  def sparams
  	params.require(:mark).permit(:s_name,:marks)
  end
end
