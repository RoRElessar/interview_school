class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[show edit update destroy]

  def index
    @subjects = Subject.all
  end

  def show; end

  def new
    @subject = Subject.new
  end

  def edit; end

  def create
    @subject = Subject.new(subject_params.merge(subject_teachers_params))
    if @subject.save
      redirect_to @subject, notice: 'Subject was successfully created.'
    else
      render :new
    end
  end

  def update
    if @subject.update(subject_params.merge(subject_teachers_params))
      redirect_to @subject, notice: 'Subject was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @subject.destroy
    redirect_to subjects_path, notice: 'Subject was successfully destroyed.'
  end

  private

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name, :description)
  end

  def subject_teachers_params
    return {} if params[:subject][:teacher_ids].nil?

    @subject.subject_teachers.each(&:mark_for_destruction) if @subject.present?
    {
      subject_teachers_attributes: params[:subject][:teacher_ids].reject(&:empty?).map { |id| { teacher_id: id } }
    }
  end
end
