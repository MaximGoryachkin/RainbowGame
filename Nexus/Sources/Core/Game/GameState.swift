//
//  GameState.swift
//  
//
//  Created by Илья Шаповалов on 13.11.2023.
//

import Foundation
import Redux
import Models

public struct GameState: Reducer, Equatable {
    var timeAmount: Double
    var score: Int
    var questions: [Question]
    var speed: GameSpeed
    var isGameCheckEnabled: Bool
    public var isPlaying: Bool
    
    //MARK: - init(_:)
    public init(
        timeAmount: Double = .init(),
        score: Int = .zero,
        questions: [Question] = .init(),
        speed: GameSpeed = .init(),
        isGameCheckEnabled: Bool = false,
        isPlaying: Bool = false
    ) {
        self.timeAmount = timeAmount
        self.score = score
        self.questions = questions
        self.speed = speed
        self.isGameCheckEnabled = isGameCheckEnabled
        self.isPlaying = isPlaying
    }
    
    //MARK: - Reduce
    mutating public func reduce(_ action: Action) {
        switch action {
        case let action as GameActions.SetTimeAmount:
            timeAmount = action.time
            
        case let action as GameActions.AddQuestions:
            questions = action.questions
            
        case is GameActions.TimerTick:
            timeAmount -= 1
            
        case is GameActions.Play:
            isPlaying = true
            
        case is GameActions.Pause:
            isPlaying = false
            
        case let action as GameActions.DidTapQuestionId:
            guard let questionIndex = questions.firstIndex(where: { $0.id == action.id }) else {
                assertionFailure("Всегда должен быть элемент по тапу")
                return
            }
            questions[questionIndex].isAnswered = true
            
        case let action as GameActions.ChangeSpeed:
            speed = action.speed
            
        default: break
        }
    }
}

extension GameState {
    //MARK: - GameSpeed
    public enum GameSpeed: Int {
        case x1 = 1
        case x2
        case x3
        case x4
        case x5
        
        public init() { self = .x1 }
    }
}
