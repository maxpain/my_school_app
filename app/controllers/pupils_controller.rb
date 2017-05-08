class PupilsController < ApplicationController

  before_action :set_pupil, only: [:show, :edit, :update, :destroy]

  def index
      @pupils = Pupil.order(params[:iluha])
  end

  def show
    @pupil = Pupil.find(params[:id])
    @subject_scores = Subject::Score.where(pupil_id: @pupil)
  end

  def new
    @pupil = Pupil.new
  end

  def edit
  end

  def create
    @pupil = Pupil.new(pupil_params)

    respond_to do |format|
      if @pupil.save
        format.html { redirect_to @pupil, notice: 'Новый ученик успешно создан' }
        format.json { render :show, status: :created, location: @pupil }
      else
        format.html { render :new }
        format.json { render json: @pupil.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pupil.update(grade_params)
        format.html { redirect_to @pupil, notice: 'Информация об ученике обновлена' }
        format.json { render :show, status: :ok, location: @pupil }
      else
        format.html { render :edit }
        format.json { render json: @pupil.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_pupil
      @pupil = Pupil.find(params[:id])
    end

    def grade_params
      params.require(:pupil).permit(:fio, :parent_id, :email)
    end

end
