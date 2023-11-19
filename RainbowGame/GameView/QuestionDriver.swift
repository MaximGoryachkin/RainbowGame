//
//  QuestionDriver.swift
//  RainbowGame
//
//  Created by Илья Шаповалов on 19.11.2023.
//

import Foundation
import Redux
import Core
import QuestionService
import OSLog

final class QuestionDriver {
    private let store: Store<AppState>
    private let questionService: QuestionService
    private var logger: Logger?
    private var lastDrop: Int = .init()
    
    private(set) lazy var asObserver: Observer<AppState> = .init { [weak self] state in
        guard let self else { return .dead }
        self.process(state)
        return .active
    }
    
    init(
        store: Store<AppState>,
        logger: Logger? = nil
    ) {
        self.store = store
        self.logger = logger
        self.questionService = .init(logger: logger)
        
    }
}

private extension QuestionDriver {
    func process(_ state: AppState) {
        guard 
            state.gameState.isPlaying,
            state.gameState.timeAmount != lastDrop
        else { return }
        
        let isCooldownEnd = (state.gameState.timeAmount % state.gameState.speed.cooldown) == 0
        
        guard isCooldownEnd else { return }
            let question = questionService.makeQuestion(
                .init(
                    symbol: state.settingsState.colors.randomElement() ?? .init(),
                    symbolColors: state.settingsState.symbolColors,
                    backgroundColors: state.settingsState.backgroundColors
                )
            )
        lastDrop = state.gameState.timeAmount
        store.dispatch(GameActions.AddQuestion(question))
    }
}
