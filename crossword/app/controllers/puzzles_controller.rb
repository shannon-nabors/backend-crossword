class PuzzlesController < ApplicationController

  def index
    @puzzles = Puzzle.all
    render json: @puzzles
  end

  def show
    @puzzle = Puzzle.find(params[:id])
    render json: @puzzle
  end

  def create
    num = (params[:number]).to_i
    user = User.find(1)
    puzzle = Puzzle.create(constructor: user)

    i = 1
    while i <= (num * num)
      r = (i.to_f/num.to_f).ceil
      c = i % num == 0 ? num : i % num

      Cell.create(shaded: false, row: r, column: c, puzzle: puzzle)

      i = i + 1
    end

    render json: puzzle
  end

  def cells
    @puzzle = Puzzle.find(params[:id])
    render json: @puzzle.cells
  end

end
