class ScoresController < ApplicationController
  before_action :find_grade, :find_pupil

  def create
    @score = @pupil.subject_scores.new(permitted_params.merge(teacher_id: current_user.id))
    if @score.save
      flash[:notice] = 'Гуд жоб'
    else
      flash[:alert] = @score.errors.full_messages.first
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
    params.require(:subject_score).permit(:subject_id, :value, :comment)
  end
end
