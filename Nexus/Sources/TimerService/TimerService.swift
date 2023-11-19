//
//  TimerDriver.swift
//
//
//  Created by Илья Шаповалов on 15.11.2023.
//

import Foundation
import Combine
import OSLog

public final class TimerService {
    //MARK: - Public properties
    public let tickTack = PassthroughSubject<Date, Never>()
    
    //MARK: - Private properties
    private let runLoop: RunLoop = .current
    private let mode: RunLoop.Mode
    private var timerPublisher: AnyCancellable?
    private var cancellable: Set<AnyCancellable> = .init()
    private var logger: Logger?
    
    //MARK: - init(_:)
    public init(
        mode: RunLoop.Mode = .default,
        logger: Logger? = nil
    ) {
        self.mode = mode
        self.logger = logger
        self.logger?.log(level: .debug, #function)
    }
    
    //MARK: - deinit
    deinit {
        timerPublisher = nil
        self.logger?.log(level: .debug, #function)
    }
    
    //MARK: - Public methods
    public func start() {
        self.logger?.log(level: .debug, #function)
        logger?.log(level: .debug, #function)
        timerPublisher = Timer
            .publish(every: 1, on: runLoop, in: mode)
            .autoconnect()
            .sink(receiveValue: tickTack.send)
    }
    
    public func stop() {
        logger?.log(level: .debug, #function)
        timerPublisher?.cancel()
    }
}
