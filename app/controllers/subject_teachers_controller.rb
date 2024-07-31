class SubjectTeachersController < ApplicationController
  before_action :set_subject_teacher, only: %i[show edit update destroy]
  before_action :set_teacher, only: %i[new create]

  def edit; end

  def show; end

  def new
    @subject_teacher = SubjectTeacher.new(level: SubjectTeacher::DEFAULT_LEVEL)
  end

  def create
    @subject_teacher = SubjectTeacher.new(subject_teacher_params)
    @subject_teacher.teacher = @teacher
    if @subject_teacher.save
      flash[:notice] = 'Class was successfully added.'
    else
      render :new
    end
  end

  def update
    if @subject_teacher.update(subject_teacher_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @subject_teacher.destroy
    flash[:notice] = 'Class was successfully removed.'
  end

  private

  def set_subject_teacher
    @subject_teacher = SubjectTeacher.find(params[:id])
  end

  def set_teacher
    @teacher = Teacher.find(params[:teacher_id])
  end

  def subject_teacher_params
    params.require(:subject_teacher).permit(:subject_id, :level)
  end
end
