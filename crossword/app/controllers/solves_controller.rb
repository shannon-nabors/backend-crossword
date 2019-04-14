class SolvesController < ApplicationController

  def index
    @solves = Solve.all
    render json: @solves
  end

  def create
    solve = Solve.create(solve_params)
    render json: solve
  end

  private

  def solve_params
    params.permit(:puzzle_id, :solver_id, :time)
  end

end
