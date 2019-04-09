require 'byebug'
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


  def setup
    num = 1
    puzzle = Puzzle.find(params[:id])

    puzzle_params[:cells].each do |cell|
      Cell.find(cell[:id]).update(cell)
    end

    cells = puzzle.cells.sort_by{ |cell| cell.id }
    find_index = cells[0].id
    rows = cells.last.row

    cells.each do |cell|
      left = cells.find{ |c| c.row == cell.row && c.column == cell.column - 1}

      top = cells.find{ |c| c.column == cell.column  && c.row == cell.row - 1}

      if (cell.shaded == false) && ((cell.row == 1 || cell.column == 1) || left.shaded == true || top.shaded == true)

        if cell.column == 1 || left.shaded == true
          cl = Clue.create(number: num, direction: "across", puzzle_id: params[:id])
        end

        if cell.row == 1 || top.shaded == true
          cl = Clue.create(number: num, direction: "down", puzzle_id: params[:id])
        end

        Cell.find(cell.id).update(number: num)
        num += 1
      end

      index = cell.id - find_index

      while index >= 0
        if cells[index].shaded || cells[index].column == 1
          cells[index].shaded ? left_word_start = cells[index + 1] : left_word_start = cells[index]
          index = cell.id - find_index
          break
        end
        index = index - 1
      end

      while index >= 0
        if cells[index].shaded || cells[index].row == 1
          cells[index].shaded ? top_word_start = cells[index + rows] : top_word_start = cells[index]
          break
        end
      end

      across_clue = left_word_start.clues.find{ |c| c.direction == "across"}
      down_clue = top_word_start.clues.find{ |c| c.direction == "down"}

      ClueCell.create(clue: across_clue, cell: cell)
      ClueCell.create(clue: down_clue, cell: cell)

    end
    render json: Puzzle.find(params[:id])
  end


  def enter
    puzzle = Puzzle.find(params[:id])

    puzzle_params[:across_clues].each do |clue|
      Clue.find(clue[:id]).update(clue)
    end

    puzzle_params[:down_clues].each do |clue|
      Clue.find(clue[:id]).update(clue)
    end

    render json: Puzzle.find(params[:id])
  end


  def cells
    @puzzle = Puzzle.find(params[:id])
    render json: @puzzle.cells
  end


  def destroy
    Puzzle.destroy(params[:id])
  end

  private

  def puzzle_params
    params.require(:puzzle).permit(:id, :title, cells:[:id, :number, :letter, :shaded, :row, :column], across_clues:[:id, :number, :direction, :content], down_clues:[:id, :number, :direction, :content])
  end

end
