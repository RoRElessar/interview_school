class ClassroomsController < ApplicationController
  before_action :set_classroom, only: %i[edit update destroy]

  def index
    @classrooms = Classroom.all
  end

  def new
    @classroom = Classroom.new
  end

  def edit; end

  def create
    @classroom = Classroom.new(classroom_params)
    if @classroom.save
      redirect_to classrooms_path, notice: 'Classroom was successfully created.'
    else
      render :new
    end
  end

  def update
    if @classroom.update(classroom_params)
      redirect_to classrooms_path, notice: 'Classroom was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @classroom.destroy
    redirect_to classrooms_path, notice: 'Classroom was successfully destroyed.'
  end

  private

  def set_classroom
    @classroom = Classroom.find(params[:id])
  end

  def classroom_params
    params.require(:classroom).permit(:name)
  end
end