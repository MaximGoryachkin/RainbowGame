//
//  GameActions.swift
//
//
//  Created by Илья Шаповалов on 13.11.2023.
//

import Foundation
import Redux
import Models

public enum GameActions {
    public struct TimerTick: Action { public init() {} }
    struct Play: Action {}
    struct Pause: Action {}
    
    struct SetTimeAmount: Action, Equatable {
        let time: Double
        init(_ time: Double) { self.time = time }
    }

    struct ChangeSpeed: Action, Equatable {
        let speed: GameState.GameSpeed
        init(_ speed: GameState.GameSpeed) { self.speed = speed }
    }
    
    struct AddQuestions: Action, Equatable {
        let questions: [Question]
        init(_ questions: [Question]) { self.questions = questions }
    }
    
    struct DidTapQuestionId: Action {
        let id: Question.ID
        init(_ id: Question.ID) { self.id = id }
    }
}
