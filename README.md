# CrossPost

Platform for constructing & solving crossword puzzles.  Frontend is React-Redux; backend is Rails API.  Styled with Semantic React.

## Current features:
- Create a puzzle.  You can choose from a set of standard grid sizes (5x5 up to 23x23) and toggle between shading/lettering before moving on to cluing.  Progress is auto-saved and you can also save manually.
- Access your created, saved and solved puzzles through your profile page.
- Solve puzzles created by other users.
- Key controls for both solving and creating puzzles are similar to other standard crossword apps (tabbing, backspacing, etc).
- Print out a formatted pdf version of a puzzle (using [react-pdf](https://github.com/diegomura/react-pdf))

## In progress:
- Add special features to squares (i.e. circled letters, shading and the like for themed puzzles)

## Future:
- Add ability to check cell/word/puzzle as you solve
- Add a way to construct cryptics (current algorithm for numbering/cluing puzzle won't permit this)

# Installation:

Not yet deployed; if you'd like to use the app, you can get instructions for installing and running the frontend [here](https://github.com/shannon-nabors/backend-crossword).  Please follow these instructions to set up the API, and then install the frontend.

## How to install:

```sh
git clone git@github.com:shannon-nabors/backend-crossword.git
```
In the crossword directory:
```sh
bundle install
rails s
```
Server should be running on localhost:3000 to be compatible with frontend (or change URL in redux/constants in the frontend directory).
