//
//  TimerDriver.swift
//
//
//  Created by Илья Шаповалов on 15.11.2023.
//

import Foundation
import Combine
import Core
import OSLog

public final class TimerDriver {
    private let store: EnvironmentStore
    private let runLoop: RunLoop
    private var timerPublisher: AnyCancellable?
    private var graphPublisher: AnyCancellable?
    private var logger: Logger?
    
    //MARK: - init(_:)
    public init(
        store: EnvironmentStore,
        runLoop: RunLoop = .main,
        logger: Logger? = nil
    ) {
        self.store = store
        self.runLoop = runLoop
        self.logger = logger
        self.logger?.log(level: .debug, #function)
        
        self.graphPublisher = store.$graph
            .removeDuplicates()
            .receive(on: runLoop)
            .sink(receiveValue: processGraph)
    }
    
    //MARK: - deinit
    deinit {
        timerPublisher = nil
        graphPublisher = nil
        self.logger?.log(level: .debug, #function)
    }
}

private extension TimerDriver {
    //MARK: - Private methods
    func start() {
        logger?.log(level: .debug, #function)
        timerPublisher = Timer
            .publish(every: 1, on: runLoop, in: .common)
            .autoconnect()
            .sink { _ in
                self.store.graph.game.timerTick()
                self.logger?.log(level: .debug, "tick")
            }
    }
    
    func stop() {
        logger?.log(level: .debug, #function)
        timerPublisher?.cancel()
    }
    
    func processGraph(_ graph: Graph) {
        switch graph.game.isPlaying {
        case true: start()
        case false: stop()
        }
    }
}
