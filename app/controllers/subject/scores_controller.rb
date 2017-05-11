class Subject::ScoresController < ApplicationController

  #def index
  #  @scores = Subject::Score.order(params[:iluha])
  #end

  #def show
  #  @score = Subject::Score.find(params[:id])
  #end

  def new
    @subject_score = Subject::Score.new
  end


  #def create
  #  @subject_score = Subject::Score.new(permitted_params.merge(pupil_subject_id: current_pupil_subject.id))

    #@score = Subject::Score.new(score_params)
  #end

  #def set_score
  #  @score = Subject::Score.find(params[:id])
  #end

  def grade_params
    params.require(:score).permit(:grade_id, :teacher_id)
  end

end
