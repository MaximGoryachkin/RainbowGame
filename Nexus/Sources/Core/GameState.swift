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
    var amountOfTime: Double
    var score: Int
    var questions: [Question]
    var speed: GameSpeed
    var isGameCheckEnabled: Bool
    
    //MARK: - init(_:)
    init(
        amountTime: Double = .init(),
        score: Int = .zero,
        totalQuestions: [Question] = .init(),
        speed: GameSpeed = .init(),
        isGameCheckEnabled: Bool = false
    ) {
        self.amountOfTime = amountTime
        self.score = score
        self.questions = totalQuestions
        self.speed = speed
        self.isGameCheckEnabled = isGameCheckEnabled
    }
    
    mutating func reduce(_ action: Action) {
        
    }
}

extension GameState {
    enum GameSpeed: Int {
        case one = 1
        
        init() { self = .one }
    }
}
