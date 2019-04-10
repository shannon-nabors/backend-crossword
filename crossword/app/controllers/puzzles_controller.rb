require 'byebug'
class PuzzlesController < ApplicationController

  def index

    allPuzzles = Puzzle.all.map do |puz|
      cells_hash = puz.cells.map do |cell|
        {id: cell.id, shaded: cell.shaded, number: cell.number, letter: cell.letter, row: cell.row, column: cell.column, clues: cell.clues}
      end
      {id: puz.id, title: puz.title, correct_letters: puz.correct_letters, across_clues: puz.across_clues, down_clues: puz.down_clues, constructor: puz.constructor, constructor_id: puz.constructor_id, cells: cells_hash}
    end

    user_solves = Solve.all.select{ |s| s.solver_id == params[:id].to_i }.map(&:puzzle_id)

    @solved_puzzles = []
    @unsolved_puzzles = []

    allPuzzles.each do |puz|
      user_solves.include?(puz[:id]) ? @solved_puzzles.push(puz) : @unsolved_puzzles.push(puz)
    end

    @user_puzzles = allPuzzles.select{ |puz| puz[:constructor_id] === params[:id] }

    render json: { solved_puzzles: @solved_puzzles, unsolved_puzzles: @unsolved_puzzles, user_puzzles: @user_puzzles }

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
          ClueCell.create(clue: cl, cell: cell)
        end

        if cell.row == 1 || top.shaded == true
          cl = Clue.create(number: num, direction: "down", puzzle_id: params[:id])
          ClueCell.create(clue: cl, cell: cell)
        end

        Cell.find(cell.id).update(number: num)
        num += 1
      end

      if cell.shaded == false
        index = cell.id - find_index

        while index >= 0
          if cells[index].shaded || cells[index].column == 1
            cells[index].shaded ? left_word_start = cells[index + 1] : left_word_start = cells[index]
          end
          break if cells[index].shaded || cells[index].column == 1
          index = index - 1
        end

        index = cell.id - find_index

        while index >= 0
          if cells[index].shaded || cells[index].row == 1
            cells[index].shaded ? top_word_start = cells[index + rows] : top_word_start = cells[index]
          end
          break if cells[index].shaded || cells[index].row == 1
          index = index - rows
        end

        across_clue = left_word_start.clues.find{ |c| c.direction == "across"}
        down_clue = top_word_start.clues.find{ |c| c.direction == "down"}


        if !cell.clues.include?(across_clue)
          ClueCell.create(clue: across_clue, cell: cell)
        end

        if !cell.clues.include?(down_clue)
          ClueCell.create(clue: down_clue, cell: cell)
        end


      end

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

    puzzle_params[:cells].each do |cell|
      Cell.find(cell[:id]).update(cell)
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
