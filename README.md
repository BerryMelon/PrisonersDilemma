# PrisonersDilemma
Swift Playground Sample of the famous Iterated Prisoner's Dilemma

## Iterated Prisoner's Dilemma
Scenario: you and your colleague, Lucifer, are in jail and suspected of committing a crime. You are isolated from each other and do not know how the other will respond to questioning. The police invite both of you to implicate the other in the crime (defect). What happens depends on what both of you do, but neither of you know how the other will respond. If Lucifer betrays you (yields to the temptation to defect) while you remain silent, then you receive the longest jail term while Lucifer gets off free (and visa versa). If you both choose to cooperate with each other (not the police) by remaining silent, there is insufficient evidence to convict both of you, so you are both given a light sentence for a lesser crime. If both of you decide to defect, then you have condemned each other to slightly reduced but still heavy sentences.
(http://www.iterated-prisoners-dilemma.net)

## How to implement
All you have to do is adopt the Person Protocol and implement neccesary variables & functions.
I added some sample Player's to give you the idea.

## How to test
Initialize the Players that will be playing the game.<br>
```swift
   let playerOne = TitForTat()
   let playerTwo = CrazyMan()
```

Initialize the game.
```swift
   let theGame = PrisonerGame(gameType: gameRule, player1: playerOne, player2: playerTwo)
```

Play; play the game 100 times.
```swift
    theGame.play(100)
```

Iterate; Iterate n times. Each game plays m times and see who won more.
```swift
    theGame.iterate(100, playsPerIteration: 100)
```
