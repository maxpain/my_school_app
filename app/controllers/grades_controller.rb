class GradesController < ApplicationController

  def index
      @grades = Grade.order(params[:iluha])
  end

  def show
    @grade = Grade.find(params[:id])
  end

  def new
    @grade = Grade.new
  end

  private

    def manufacturer_params
      params.require(:grade).permit(:name, :theacher_id, :comment)
    end

end
