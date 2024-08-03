//
//  ConsoleLogger.swift
//  
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

import Foundation

/// Class for logging messages to the console.
public class ConsoleLogger: Logging {
    private let dateFormatter: DateFormatter
    private let minimumLogLevel: LogLevel
    
    public init(minimumLogLevel: LogLevel = .info) {
        self.minimumLogLevel = minimumLogLevel
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
    }

    public func log(
        _ message: String,
        level: LogLevel = .info
    ) {
        guard level >= minimumLogLevel else { return }
        let timestamp = dateFormatter.string(from: Date())
        print("[\(level.rawValue)] [\(timestamp)]: \(message)")
    }
}
