//
//  GameState.swift
//  
//
//  Created by Илья Шаповалов on 13.11.2023.
//

import Foundation
import Redux

struct Question {
    
}

struct GameState: Reducer {
    var timeAmount: Double
    var score: Int
    var questions: [Question]
    var speed: GameSpeed
    var isGameCheckEnabled: Bool
    
    //MARK: - init(_:)
    init(
        timeAmount: Double = .init(),
        score: Int = .zero,
        totalQuestions: [Question] = .init(),
        speed: GameSpeed = .init(),
        isGameCheckEnabled: Bool = false
    ) {
        self.timeAmount = timeAmount
        self.score = score
        self.questions = totalQuestions
        self.speed = speed
        self.isGameCheckEnabled = isGameCheckEnabled
    }
    
    mutating func reduce(_ action: Action) {
        switch action {
        case let action as GameActions.SetTimeAmount:
            timeAmount = action.time
            
        case is GameActions.TimerTick:
            timeAmount -= 1
            
        case let action as GameActions.ChangeSpeed:
            speed = action.speed
            
        default: break
        }
    }
}

extension GameState {
    //MARK: - GameSpeed
    enum GameSpeed: Int {
        case x1 = 1
        case x2
        case x3
        case x4
        case x5
        
        init() { self = .x1 }
    }
}
