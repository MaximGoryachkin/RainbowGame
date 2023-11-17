//
//  SoundDriver.swift
//
//
//  Created by Илья Шаповалов on 17.11.2023.
//

import Foundation
import AVFoundation
import Combine
import Core
import OSLog

public final class SoundDriver {
    private let store: EnvironmentStore
    private var logger: Logger?
    private var cancellable: AnyCancellable?
    private let queuePlayer = AVQueuePlayer()
    private var looper: AVPlayerLooper?
    
    public init(
        store: EnvironmentStore,
        logger: Logger? = nil
    ) {
        self.store = store
        self.logger = logger
        cancellable = store.$graph
            .removeDuplicates()
            .sink(receiveValue: process(_:))
        
        guard let url = Bundle.module.url(forResource: "timer1", withExtension: "mp3") else {
            logger?.error("Timer tack not fount")
            return
        }
        let item = AVPlayerItem(url: url)
        looper = .init(player: queuePlayer, templateItem: item)
        
        logger?.log(level: .debug, #function)
    }
}

private extension SoundDriver {
    func process(_ graph: Graph) {
        switch graph.game.isPlaying {
        case true:
            queuePlayer.play()
        case false:
            queuePlayer.pause()
        }
    }
}
