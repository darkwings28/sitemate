class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show, :update, :destroy]

  def index
    @problems = Problem.all
    render json: @problems
  end

  def show
    render json: @problem
  end

  def create
    @problem = Problem.new(problem_params)

    if @problem.save
      render json: @problem, status: :created
    else
      render json: @problem.errors, status: :unprocessable_entity
    end
  end

  def update
    if @problem.update(problem_params)
      render json: @problem
    else
      render json: @problem.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @problem.destroy
  end

  private

  def set_problem
    @problem = Problem.find(params[:id])
  end

  def problem_params
    params.require(:problem).permit(:title, :description)
  end
end
