class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  def index
      @grades = Grade.order(params[:iluha])
  end

  def show
    @grade = Grade.find(params[:id])
  end

  def new
    @grade = Grade.new
  end

  def create
    @grade = Grade.new(grade_params)

    respond_to do |format|
      if @grade.save
        format.html { redirect_to @grade, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @grade }
      else
        format.html { render :new }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to @grade, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_grade
      @grade = Grade.find(params[:id])
    end

    def grade_params
      params.require(:grade).permit(:name, :teacher_id, :comment)
    end

end
