class TruanciesController < ApplicationController
  before_action :find_grade, :find_pupil

  def create
    @truancy = @pupil.truancies.new(permitted_params.merge(pupil_id: @pupil.id, check: true))
    if @truancy.save
      flash[:notice] = 'Успешно'
    else
      flash[:alert] = @truancy.errors.full_messages.first
    end
    redirect_to grade_pupil_path(@grade, @pupil)
  end

  private

  def find_grade
    @grade = Grade.find(params[:grade_id])
  end

  def find_pupil
    @pupil = @grade.pupils.find(params[:pupil_id])
  end

  def permitted_params
    params.require(:truancy).permit(:pupil_id, :check, :reason)
  end
end
