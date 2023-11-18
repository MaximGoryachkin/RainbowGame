//
//  QuestionService.swift
//  
//
//  Created by Илья Шаповалов on 15.11.2023.
//

import Foundation
import Combine
import OSLog

public final class QuestionService {
    private var cancellable: AnyCancellable?
    private var logger: Logger?
    
    //MARK: - init(_:)
    public init(
        logger: Logger? = nil
    ) {
        self.logger = logger
        
        self.logger?.log(level: .debug, #function)
    }
    
    //MARK: - deinit
    deinit {
        cancellable = nil
    }
    
    //MARK: - Public methods
    
}
