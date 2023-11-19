//
//  SoundService.swift
//
//
//  Created by Илья Шаповалов on 17.11.2023.
//

import Foundation
import AVFoundation
import OSLog

public final class SoundService {
    private var logger: Logger?
    private let queuePlayer = AVQueuePlayer()
    private var looper: AVPlayerLooper?
    
    //MARK: - init(_:)
    public init(logger: Logger? = nil) {
        self.logger = logger
        
        guard let url = Bundle.module.url(
            forResource: "timer1",
            withExtension: "mp3"
        ) else {
            logger?.error("Timer track not fount")
            return
        }
        let item = AVPlayerItem(url: url)
        looper = .init(player: queuePlayer, templateItem: item)
        
        logger?.log(level: .debug, #function)
    }
    
    //MARK: - Public methods
    public func play() {
        logger?.log(level: .debug, #function)
        queuePlayer.play()
    }
    
    public func pause() {
        logger?.log(level: .debug, #function)
        queuePlayer.pause()
    }
}
