//
//  QuestionService.swift
//  
//
//  Created by Илья Шаповалов on 15.11.2023.
//

import Foundation
import Combine
import OSLog
import Models
import SwiftUI

public final class QuestionService {
    private var cancellable: AnyCancellable?
    private var logger: Logger?
    
    //MARK: - init(_:)
    public init(logger: Logger? = nil) {
        self.logger = logger
        
        self.logger?.log(level: .debug, #function)
    }
    
    //MARK: - deinit
    deinit {
        cancellable = nil
    }
    
    //MARK: - Public methods
    public func makeQuestion(_ settings: Settings) -> Question {
        logger?.log(level: .debug, #function)
        
        guard
            let symbolColor = settings.symbolColors.randomElement(),
            let backgroundColor = settings.backgroundColors.filter({ $0 != symbolColor }).randomElement()
        else {
 //           assertionFailure("Invalid settings")
            return Question()
        }
        
        return Question(
            colorName: settings.symbol,
            symbolColor: symbolColor,
            backgroundColor: backgroundColor
            )
    }
}

public extension QuestionService {
    struct Settings {
        public let symbol: String
        public let symbolColors: [Color]
        public let backgroundColors: [Color]
        
        public init(
            symbol: String,
            symbolColors: [Color],
            backgroundColors: [Color]
        ) {
            self.symbol = symbol
            self.symbolColors = symbolColors
            self.backgroundColors = backgroundColors
        }
    }
}
