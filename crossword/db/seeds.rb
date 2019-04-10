

User.create(name: "Shannon Nabors", username: "snabes", email: "shannon.nabors@gmail.com", password: "shannon")

User.create(name: "Artem Metelskyi", username: "Metart", email: "artemmetelskyi@gmail.com", password: "artem")

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







Puzzle.create(title: "Under Pressure", constructor_id: 1)

Cell.create(shaded: false, number: 1, letter: "H", row: 1, column: 1, puzzle_id: 2)

Cell.create(shaded: false, number: 2, letter: "I", row: 1, column: 2, puzzle_id: 2)

Cell.create(shaded: true, row: 1, column: 3, puzzle_id: 2)

Cell.create(shaded: true, row: 1, column: 4, puzzle_id: 2)

Cell.create(shaded: false, number: 3, letter: "J", row: 2, column: 1, puzzle_id: 2)

Cell.create(shaded: false, letter: "K", row: 2, column: 2, puzzle_id: 2)

Cell.create(shaded: false, number: 4, letter: "L", row: 2, column: 3, puzzle_id: 2)

Cell.create(shaded: false, number: 5, letter: "M", row: 2, column: 4, puzzle_id: 2)

Cell.create(shaded: false, number: 6, letter: "N", row: 3, column: 1, puzzle_id: 2)

Cell.create(shaded: false, letter: "O", row: 3, column: 2, puzzle_id: 2)

Cell.create(shaded: false, letter: "P", row: 3, column: 3, puzzle_id: 2)

Cell.create(shaded: false, letter: "Q", row: 3, column: 4, puzzle_id: 2)

Cell.create(shaded: true, row: 4, column: 1, puzzle_id: 2)

Cell.create(shaded: true, row: 4, column: 2, puzzle_id: 2)

Cell.create(shaded: false, number: 7, letter: "R", row: 4, column: 3, puzzle_id: 2)

Cell.create(shaded: false, letter: "S", row: 4, column: 4, puzzle_id: 2)


Clue.create(number: 1, direction: "across", content: "HI", puzzle_id: 2)

Clue.create(number: 3, direction: "across", content: "JKLM", puzzle_id: 2)

Clue.create(number: 6, direction: "across", content: "NOPQ", puzzle_id: 2)

Clue.create(number: 7, direction: "across", content: "RS", puzzle_id: 2)

Clue.create(number: 1, direction: "down", content: "HJN", puzzle_id: 2)

Clue.create(number: 2, direction: "down", content: "IKO", puzzle_id: 2)

Clue.create(number: 4, direction: "down", content: "LPR", puzzle_id: 2)

Clue.create(number: 5, direction: "down", content: "MQS", puzzle_id: 2)


ClueCell.create(cell_id: 10, clue_id: 7, position: 1)
ClueCell.create(cell_id: 10, clue_id: 11, position: 1)

ClueCell.create(cell_id: 11, clue_id: 7, position: 2)
ClueCell.create(cell_id: 11, clue_id: 12, position: 1)

ClueCell.create(cell_id: 14, clue_id: 8, position: 1)
ClueCell.create(cell_id: 14, clue_id: 11, position: 2)

ClueCell.create(cell_id: 15, clue_id: 8, position: 2)
ClueCell.create(cell_id: 15, clue_id: 12, position: 2)

ClueCell.create(cell_id: 16, clue_id: 8, position: 3)
ClueCell.create(cell_id: 16, clue_id: 13, position: 1)

ClueCell.create(cell_id: 17, clue_id: 8, position: 4)
ClueCell.create(cell_id: 17, clue_id: 14, position: 1)

ClueCell.create(cell_id: 18, clue_id: 9, position: 1)
ClueCell.create(cell_id: 18, clue_id: 11, position: 3)

ClueCell.create(cell_id: 19, clue_id: 9, position: 2)
ClueCell.create(cell_id: 19, clue_id: 12, position: 3)

ClueCell.create(cell_id: 20, clue_id: 9, position: 3)
ClueCell.create(cell_id: 20, clue_id: 13, position: 2)

ClueCell.create(cell_id: 21, clue_id: 9, position: 4)
ClueCell.create(cell_id: 21, clue_id: 14, position: 2)

ClueCell.create(cell_id: 24, clue_id: 10, position: 1)
ClueCell.create(cell_id: 24, clue_id: 13, position: 3)

ClueCell.create(cell_id: 25, clue_id: 10, position: 2)
ClueCell.create(cell_id: 25, clue_id: 14, position: 3)





































#
