import Foundation

public protocol GameRule {
    
    var ccPoint:Int { get }
    var cdPoint:Int { get }
    var dcPoint:Int { get }
    var ddPoint:Int { get }
    
}

public enum Action:String {
    case Cooperate = "COORPERATE"
    case Defect = "DEFECT"
}

public protocol Player {
    
    var name:String { get }
    var point:Int { get set }
    
    func play() -> Action
    
    func opponentPlayed(action:Action)
}

public class PrisonerGame {
    
    private let gameType:GameRule
    private var playerOne:Player
    private var playerTwo:Player
    private var iterationMode = false
    
    public init(gameType:GameRule, player1:Player, player2:Player) {
        
        self.gameType = gameType
        self.playerOne = player1
        self.playerTwo = player2
    }
    
    public func play(numberOfIterations:Int) -> Player? {
        
        for index in 0...numberOfIterations-1 {
            
            let playerOneAction = self.playerOne.play()
            let playerTwoAction = self.playerTwo.play()
            
            var playerOnePoint = 0
            var playerTwoPoint = 0
            
            if playerOneAction == Action.Cooperate && playerTwoAction == Action.Cooperate {
                playerOnePoint = self.gameType.ccPoint
                playerTwoPoint = self.gameType.ccPoint
            }
            
            if playerOneAction == Action.Cooperate && playerTwoAction == Action.Defect {
                playerOnePoint = self.gameType.cdPoint
                playerTwoPoint = self.gameType.dcPoint
            }
            
            if playerOneAction == Action.Defect && playerTwoAction == Action.Cooperate {
                playerOnePoint = self.gameType.dcPoint
                playerTwoPoint = self.gameType.cdPoint
            }
            
            if playerOneAction == Action.Defect && playerTwoAction == Action.Defect {
                playerOnePoint = self.gameType.ddPoint
                playerTwoPoint = self.gameType.ddPoint
            }
            
            self.playerOne.opponentPlayed(playerTwoAction)
            self.playerTwo.opponentPlayed(playerOneAction)
            
            self.playerOne.point += playerOnePoint
            self.playerTwo.point += playerTwoPoint
            
            if !self.iterationMode {
                print("<Session \(index+1)>")
                print("\(self.playerOne.name): \(playerOneAction.rawValue)")
                print("\(self.playerTwo.name): \(playerTwoAction.rawValue)")
                print("------")
                print("[\(self.playerOne.name)] +\(playerOnePoint)")
                print("[\(self.playerTwo.name)] +\(playerTwoPoint)")
                print("------")
                print("")
            }
            
        }
        
        if !self.iterationMode {
            print("<Game Over>")
            print("\(self.playerOne.name): \(self.playerOne.point) points")
            print("\(self.playerTwo.name): \(self.playerTwo.point) points")
            print("")
        }
        
        if self.playerOne.point > self.playerTwo.point {
            print("\(self.playerOne.name.uppercaseString) WINS")
            return self.playerOne
        }
        else if self.playerOne.point < self.playerTwo.point {
            print("\(self.playerTwo.name.uppercaseString) WINS")
            return self.playerTwo
        }
        else {
            print("It's a DRAW")
            return nil
        }
    }
    
    public func iterate(numberOfIteration:Int,playsPerIteration:Int) {
        
        self.iterationMode = true
        
        var playerOneWins = 0
        var playerTwoWins = 0
        
        for _ in 0...numberOfIteration-1 {
            
            let winner = self.play(playsPerIteration)
            if winner == nil {
                continue
            }
            
            if winner!.name == self.playerOne.name {
                playerOneWins++
            }
            else {
                playerTwoWins++
            }
        }
        
        print("<Game Over>")
        print("[\(self.playerOne.name.uppercaseString)] Wins \(playerOneWins) times")
        print("[\(self.playerTwo.name.uppercaseString)] Wins \(playerTwoWins) times")
        
        self.playerOne.point = 0
        self.playerTwo.point = 0
    }
    
}