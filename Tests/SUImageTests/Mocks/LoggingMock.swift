//
//  LoggingMock.swift
//  
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

import XCTest
@testable import SUImage

class LoggerMock: Logging {
    var loggedMessages: [String] = []

    func log(_ message: String, level: LogLevel) {
        loggedMessages.append(message)
    }
}
