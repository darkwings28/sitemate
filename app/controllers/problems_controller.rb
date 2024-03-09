# app/controllers/problems_controller.rb

class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show, :edit, :update, :destroy]

  def index
    @problems = ProblemClient.read_all
  end

  def show
    @problem = ProblemClient.read(params[:id])
  end

  def new
    @problem = Problem.new
  end

  def create
    ProblemClient.create(problem_params[:title], problem_params[:description])
    redirect_to problems_path, notice: 'Problem was successfully created.'
  end

  def edit
  end

  def update
    ProblemClient.update(params[:id], problem_params[:title], problem_params[:description])
    redirect_to problem_path(@problem), notice: 'Problem was successfully updated.'
  end

  def destroy
    ProblemClient.delete(params[:id])
    redirect_to problems_path, notice: 'Problem was successfully deleted.'
  end

  private

  def set_problem
    @problem = ProblemClient.read(params[:id])
  end

  def problem_params
    params.require(:problem).permit(:title, :description)
  end
end
