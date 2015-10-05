
import UIKit

// Initialize Players Here
let playerOne = Punisher()
let playerTwo = CrazyMan()

// Initialize Game Rule
let gameRule = Standard()

// Initialize the game.
let theGame = PrisonerGame(gameType: gameRule, player1: playerOne, player2: playerTwo)

// Play; play the game n times.
// Iterate; Iterate n times. Each game plays m times and see who won more.
theGame.play(100)



