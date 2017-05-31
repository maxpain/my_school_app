class PupilsController < ApplicationController
  before_action :set_grade
  before_action :set_pupil, only: [:show, :edit, :update, :destroy]

  def index
    @pupils = Pupil.order(params[:iluha])
  end

  def show
    @parent = Parent.find(@pupil.parent_id) if @pupil.parent_id?
    @subject_scores = @pupil.subject_scores.order(created_at: :desc)
    @average_scores = @pupil.subject_scores.joins(:subject).
                        select('subjects.id, subjects.name AS subject_name,
                                AVG(subject_scores.value) AS average_value'
                              ).group('subjects.id')
  end

  def new
    @pupil = @grade.pupils.new
  end

  def edit
  end

  def create
    @pupil = @grade.pupils.new(pupil_params)
    if @pupil.save
      redirect_to grade_pupil_path(@grade, @pupil),
                  notice: 'Новый ученик успешно создан'
    else
      render :new
    end
  end

  def update
    if @pupil.update(pupil_params)
      redirect_to grade_pupil_path(@grade, @pupil),
                  notice: 'Информация об ученике обновлена'
    else
      render :edit
    end
  end

  private

  def set_pupil
    @pupil = @grade.pupils.find(params[:id])
  end

  def set_grade
    @grade = Grade.find(params[:grade_id])
  end

  def pupil_params
    params.require(:pupil).permit(:fio, :parent_id, :email, :grade_id, :password, :address, :phone, :birthdate)
  end
end

