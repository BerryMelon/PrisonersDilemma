import Foundation

/** 
    GOODMAN
    Always Cooperates
**/
public class GoodMan:Player {
    
    public let name = "Tyriel"
    public var point = 0
    //    var opponentsPlay = [Action]()
    
    public init() {
        
    }
    
    public func play() -> Action {
        
        return .Cooperate
    }
    
    public func opponentPlayed(action: Action) {
        
    }
}


/**
    BADMAN
    Always Defects
**/
public class BadMan:Player {
    
    public let name = "Diablo"
    public var point = 0
    //    var opponentsPlay = [Action]()
    
    public init() {
        
    }
    
    public func play() -> Action {
        
        return .Defect
    }
    
    public func opponentPlayed(action: Action) {
        
    }
}

/**
    CRAZYMAN
    Everytime random
**/
public class CrazyMan:Player {
    
    public let name = "Crazy Bill"
    public var point = 0
    
    public init() {
        
    }
    
    public func play() -> Action {
        
        let random = Int(arc4random_uniform(2))
        
        switch random {
        case 0:
            return .Defect
        case 1:
            return .Cooperate
        default:
            return .Defect
        }
    }
    
    public func opponentPlayed(action: Action) {
        
    }
}

/**
    TitForTat
    The famous tit for tat. Cooperates whenever possible. But when the opponent Defects, this guy takes it seriously
**/
public class TitForTat:Player {
    
    public let name = "Tirion the Advenger"
    public var point = 0
    var opponentsLastPlay:Action? = nil
    
    public init() {
        
    }
    
    public func play() -> Action {
        guard let opponentPlay = self.opponentsLastPlay else {
            return .Cooperate
        }
        
        if opponentPlay == .Cooperate {
            return .Cooperate
        }
        else {
            return .Defect
        }
        
    }
    
    public func opponentPlayed(action: Action) {
        self.opponentsLastPlay = action
    }
}

/**
Grudger
Co-operate until the opponent defects. Then always defect unforgivingly.
**/
public class Grudger:Player {
    
    public let name = "Geary the Grudger"
    public var point = 0
    var didOpponentDefect = false
    
    public init() {
        
    }
    
    public func play() -> Action {
        
        if didOpponentDefect {
            return .Defect
        }
        
        return .Cooperate
    }
    
    public func opponentPlayed(action: Action) {
        if !didOpponentDefect {
            if action == .Defect {
                self.didOpponentDefect = true
            }
        }
    }
}

/**
Punisher
Co-operate until the opponent defects. Then punishes him with 5 defects. Then Repeat
**/
public class Punisher:Player {
    
    public let name = "Max the Punisher"
    public var point = 0
    var didOpponentDefect = false
    var punishCount = 0
    
    public init() {
        
    }
    
    public func play() -> Action {
        
        if didOpponentDefect {
            
            if punishCount < 5 {
                punishCount++
                return .Defect
            }

        }
        
        if punishCount == 5 {
            punishCount = 0
            didOpponentDefect = false
        }
        
        return .Cooperate
    }
    
    public func opponentPlayed(action: Action) {
        if !didOpponentDefect {
            if action == .Defect {
                self.didOpponentDefect = true
            }
        }
    }
}