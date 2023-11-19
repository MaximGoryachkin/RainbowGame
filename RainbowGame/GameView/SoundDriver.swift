//
//  SoundDriver.swift
//  RainbowGame
//
//  Created by Илья Шаповалов on 19.11.2023.
//

import Foundation
import Redux
import Core
import SoundService
import OSLog

final class SoundDriver {
    private let store: Store<AppState>
    private let soundService: SoundService
    private var logger: Logger?
    
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
        self.soundService = .init(logger: logger)
    }
}

private extension SoundDriver {
    func process(_ state: AppState) {
        switch state.gameState.isPlaying {
        case true: soundService.play()
        case false: soundService.pause()
        }
    }
}
