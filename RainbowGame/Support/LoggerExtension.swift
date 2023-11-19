//
//  LoggerExtension.swift
//  RainbowGame
//
//  Created by Илья Шаповалов on 19.11.2023.
//

import Foundation
import OSLog

extension Logger {
    static let system = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: "System"
    )
}
