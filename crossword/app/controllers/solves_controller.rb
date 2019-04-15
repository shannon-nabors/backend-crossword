require 'byebug'
class SolvesController < ApplicationController

  def by_user
    @solves = Solve.select{ |s| s.solver_id == params[:id].to_i}
    render json: @solves
  end

  def by_puzzle
    @solves = Solve.select{ |s| s.puzzle_id == params[:id].to_i }.sort_by{ |s| s.time }
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
