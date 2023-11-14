//
//  GameActions.swift
//
//
//  Created by Илья Шаповалов on 13.11.2023.
//

import Foundation
import Redux
import Models

enum GameActions {
    struct TimerTick: Action { }
    
    struct SetTimeAmount: Action {
        let time: Double
        init(_ time: Double) { self.time = time }
    }

    struct ChangeSpeed: Action {
        let speed: GameState.GameSpeed
        init(_ speed: GameState.GameSpeed) { self.speed = speed }
    }
    
    struct AddQuestions: Action {
        let questions: [Question]
        init(_ questions: [Question]) { self.questions = questions }
    }
    
    struct DidTapQuestionId: Action {
        let id: Question.ID
        init(_ id: Question.ID) { self.id = id }
    }
}
