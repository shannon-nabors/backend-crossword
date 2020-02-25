require 'byebug'
class PuzzlesController < ApplicationController

  def index

    allPuzzles = Puzzle.all.map do |puz|
      cells_hash = puz.cells.map do |cell|
        {id: cell.id, shaded: cell.shaded, number: cell.number, letter: cell.letter, row: cell.row, column: cell.column, clues: cell.clues}
      end
      {id: puz.id, complete: puz.complete, title: puz.title, correct_letters: puz.correct_letters, across_clues: puz.across_clues, down_clues: puz.down_clues, constructor: puz.constructor, constructor_id: puz.constructor_id, cells: cells_hash, average: puz.average_solve_time, favorites: puz.total_favs}
    end

    user_solves = Solve.all.select{ |s| s.solver_id == params[:id].to_i }.map(&:puzzle_id)

    @solved_puzzles = []
    @unsolved_puzzles = []
    @user_puzzles = []
    @saved_puzzles = []

    allPuzzles.each do |puz|
      if puz[:constructor_id] == params[:id].to_i && puz[:complete]
        @user_puzzles.push(puz)
      elsif puz[:constructor_id] == params[:id].to_i && !puz[:complete]
        @saved_puzzles.push(puz)
      elsif user_solves.include?(puz[:id])
        @solved_puzzles.push(puz)
      elsif puz[:complete]
        @unsolved_puzzles.push(puz)
      end
    end
    
    render json: { solved_puzzles: @solved_puzzles, unsolved_puzzles: @unsolved_puzzles, user_puzzles: @user_puzzles, saved_puzzles: @saved_puzzles }

  end

  def anonymous_index
    allPuzzles = Puzzle.all.map do |puz|
      cells_hash = puz.cells.map do |cell|
        {id: cell.id, shaded: cell.shaded, number: cell.number, letter: cell.letter, row: cell.row, column: cell.column, clues: cell.clues}
      end
      {id: puz.id,  complete: puz.complete, title: puz.title, correct_letters: puz.correct_letters, across_clues: puz.across_clues, down_clues: puz.down_clues, constructor: puz.constructor, constructor_id: puz.constructor_id, cells: cells_hash, average: puz.average_solve_time, favorites: puz.total_favs}
    end.select {|puz| puz[:complete]}

    render json: { solved_puzzles: [], unsolved_puzzles: allPuzzles, user_puzzles: [], saved_puzzles: [] }
  end

  def show
    @puzzle = Puzzle.find(params[:id])
    puz = PuzzleSerializer.new(@puzzle).to_json
    render json: puz
  end

  def create
    num = (params[:number]).to_i
    user = params[:newPuzzle][:constructor]
    puzzle = Puzzle.create(constructor_id: user[:id], complete: false)

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
    # Set counter for numbering, find puzzle instance
    num = 1
    puzzle = Puzzle.find(params[:id])
    
    puzzle.clues.destroy_all

    # Iterate through the cells array received as params
    puzzle_params[:cells].each do |cell|
      # For each one, find the matching backend cell & update to match frontend
      Cell.find(cell[:id]).update(cell)
    end


    # Sort backend puzzle's cells so they're in order of id
    # Find the first cell and the total number of rows/columns
    cells = puzzle.cells.sort_by{ |cell| cell.id }
    find_index = cells[0].id
    rows = cells.last.row

    cells.each do |cell|
      # Find the cell to the left of this one, if it exists
      left = cells.find{ |c| c.row == cell.row && c.column == cell.column - 1}

      # Find the cell above this one, if it exists
      top = cells.find{ |c| c.column == cell.column  && c.row == cell.row - 1}

      # If the cell is unshaded AND it's either in the first row or column,
      # or comes after or below a shaded cell (i.e. any cell that should be numbered)
      if (cell.shaded == false) && ((cell.row == 1 || cell.column == 1) || left.shaded == true || top.shaded == true)

        # if the cell is the beginning of an ACROSS clue
        if cell.column == 1 || left.shaded == true
          cl = Clue.create(number: num, direction: "across", puzzle_id: params[:id])
          ClueCell.create(clue: cl, cell: cell)
        end

        # if the cell is the beginning of a DOWN clue
        if cell.row == 1 || top.shaded == true
          cl = Clue.create(number: num, direction: "down", puzzle_id: params[:id])
          ClueCell.create(clue: cl, cell: cell)
        end

        Cell.find(cell.id).update(number: num)
        num += 1
      else
        if cell.number
          Cell.find(cell.id).update(number: nil)
        end
      end

      # If the cell is unshaded
      if cell.shaded == false
        # Find the index of the cell within puzzle.cells
        index = cell.id - find_index

        # Find what cell is the starter cell of this cell's across/down words:

        # Iterate backwards through the puzzle's cells starting with this one
        while index >= 0
          if cells[index].shaded || cells[index].column == 1
            # if this cell is shaded, word should start in the cell to the right
            # else, the word starts in this cell
            cells[index].shaded ? left_word_start = cells[index + 1] : left_word_start = cells[index]
          end
          # Stop if this cell is shaded or in the first column
          break if cells[index].shaded || cells[index].column == 1
          index = index - 1
        end

        # Reset index
        index = cell.id - find_index

        # Iterate backwards through the puzzle's cells starting with this one
        while index >= 0
          if cells[index].shaded || cells[index].row == 1
            # if this cell is shaded, word should start in the cell above
            # else, the word starts in this cell
            cells[index].shaded ? top_word_start = cells[index + rows] : top_word_start = cells[index]
          end
          # Stop if this cell is shaded or in the first row
          break if cells[index].shaded || cells[index].row == 1
          index = index - rows
        end

        # Set the across and down clues that are associated with this cell
        # according to the clues associated with the starter cells found above
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

  def letter
    puzzle = Puzzle.find(params[:id])

    puzzle_params[:cells].each do |cell|
      Cell.find(cell[:id]).update(cell)
    end

    render json: puzzle
  end

  def clue
    puzzle = Puzzle.find(params[:id])

    puzzle_params[:across_clues].each do |clue|
      Clue.find(clue[:id]).update(clue)
    end

    puzzle_params[:down_clues].each do |clue|
      Clue.find(clue[:id]).update(clue)
    end

    puzzle.update(title: puzzle_params[:title])
    render json: puzzle
  end

  def enter
    puzzle = Puzzle.find(params[:id])

    puzzle_params[:across_clues].each do |clue|
      Clue.find(clue[:id]).update(clue)
    end

    puzzle_params[:down_clues].each do |clue|
      Clue.find(clue[:id]).update(clue)
    end

    # puzzle_params[:cells].each do |cell|
    #   Cell.find(cell[:id]).update(cell)
    # end

    puzzle.update(title: puzzle_params[:title], complete: true)
    render json: puzzle
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
    params.require(:puzzle).permit(:id, :title, cells:[:id, :number, :letter, :shaded, :row, :column], across_clues:[:id, :number, :direction, :content], down_clues:[:id, :number, :direction, :content], constructor:[user:[:name, :email, :username, :id]])
  end

end
