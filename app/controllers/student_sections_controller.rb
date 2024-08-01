class StudentSectionsController < ApplicationController
  before_action :set_student_section, only: %i[show edit update destroy]
  before_action :set_student, only: %i[new create]

  def edit; end

  def show; end

  def new
    @student_section = StudentSection.new
  end

  def create
    @student_section = StudentSection.new(subject_teacher_params)
    @student_section.student = @student
    if @student_section.save
      flash[:notice] = 'Section was successfully added.'
    else
      render :new
    end
  end

  def update
    if @student_section.update(subject_teacher_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @student_section.destroy
    flash[:notice] = 'Section was successfully removed.'
  end

  private

  def set_student_section
    @student_section = StudentSection.find(params[:id])
  end

  def set_student
    @student = Student.find(params[:student_id])
  end

  def student_section_params
    params.require(:student_section).permit(:section_id, :start_time, :end_time)
  end
end
