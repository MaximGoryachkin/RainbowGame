//
//  TimerDriver.swift
//  RainbowGame
//
//  Created by Илья Шаповалов on 19.11.2023.
//

import Foundation
import Core
import Redux
import TimerService
import OSLog
import Combine

final class TimerDriver {
    private let timer: TimerService
    private let store: Store<AppState>
    private var logger: Logger?
    private var cancellable: AnyCancellable?
    
    private(set) lazy var asObserver: Observer<AppState> = .init(
        queue: .main
    ) { [weak self] state in
        guard let self else { return .dead }
        self.process(state)
        return .active
    }
    
    //MARK: - init(_:)
    init(
        store: Store<AppState>,
        logger: Logger? = nil
    ) {
        self.store = store
        self.logger = logger
        self.timer = .init(logger: logger)
        
        self.cancellable = timer.tickTack
            .receive(on: RunLoop.main)
            .sink(receiveValue: handle(event:))
    }
}

private extension TimerDriver {
    func process(_ state: AppState) {
        switch state.gameState.isPlaying {
        case true: timer.start()
        case false: timer.stop()
        }
    }
    
    func handle(event: Date) {
        store.dispatch(GameActions.TimerTick())
    }
}
