class PuzzlesController < ApplicationController

  def index
    @puzzles = Puzzle.all
    render json: @puzzles
  end

  def show
    @puzzle = Puzzle.find(params[:id])
    render json: @puzzle
  end

  def cells
    @puzzle = Puzzle.find(params[:id])
    render json: @puzzle.cells
  end

end
