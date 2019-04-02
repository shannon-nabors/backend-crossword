# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name: "Shannon Nabors", username: "snabes", email: "shannon.nabors@gmail.com", password: "shannon")

Puzzle.create(title: "Pregaming", constructor_id: 1)

Cell.create(shaded: true, row: 1, column: 1, puzzle_id: 1)

Cell.create(shaded: false, number: 1, letter: "A", row: 1, column: 2, puzzle_id: 1)

Cell.create(shaded: false, number: 2, letter: "B", row: 1, column: 3, puzzle_id: 1)

Cell.create(shaded: false, number: 3, letter: "C", row: 2, column: 1, puzzle_id: 1)

Cell.create(shaded: false, letter: "D", row: 2, column: 2, puzzle_id: 1)

Cell.create(shaded: false, letter: "E", row: 2, column: 3, puzzle_id: 1)

Cell.create(shaded: false, number: 4, letter: "F", row: 3, column: 1, puzzle_id: 1)

Cell.create(shaded: false, letter: "G", row: 3, column: 2, puzzle_id: 1)

Cell.create(shaded: true, row: 3, column: 3, puzzle_id: 1)

Clue.create(number: 1, direction: "across", content: "AB", puzzle_id: 1)

Clue.create(number: 3, direction: "across", content: "CDE", puzzle_id: 1)

Clue.create(number: 4, direction: "across", content: "FG", puzzle_id: 1)

Clue.create(number: 1, direction: "down", content: "ADG", puzzle_id: 1)

Clue.create(number: 2, direction: "down", content: "BE", puzzle_id: 1)

Clue.create(number: 3, direction: "down", content: "CF", puzzle_id: 1)


ClueCell.create(cell_id: 2, clue_id: 1, position: 1)
ClueCell.create(cell_id: 2, clue_id: 4, position: 1)

ClueCell.create(cell_id: 3, clue_id: 1, position: 2)
ClueCell.create(cell_id: 3, clue_id: 5, position: 1)

ClueCell.create(cell_id: 4, clue_id: 2, position: 1)
ClueCell.create(cell_id: 4, clue_id: 6, position: 1)

ClueCell.create(cell_id: 5, clue_id: 4, position: 2)
ClueCell.create(cell_id: 5, clue_id: 2, position: 2)

ClueCell.create(cell_id: 6, clue_id: 5, position: 2)
ClueCell.create(cell_id: 6, clue_id: 2, position: 3)

ClueCell.create(cell_id: 7, clue_id: 6, position: 2)
ClueCell.create(cell_id: 7, clue_id: 3, position: 1)

ClueCell.create(cell_id: 8, clue_id: 4, position: 3)
ClueCell.create(cell_id: 8, clue_id: 3, position: 2)






































#
