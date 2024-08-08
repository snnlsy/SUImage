//
//  SUConsoleLogger.swift
//
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

import Foundation

/// Class for logging messages to the console.
public class SUConsoleLogger: SULogging {
    private let dateFormatter: DateFormatter
    private let minimumLogLevel: SULogLevel
    
    public init(minimumLogLevel: SULogLevel = .info) {
        self.minimumLogLevel = minimumLogLevel
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
    }

    public func log(
        _ message: String,
        level: SULogLevel = .info
    ) {
        guard level >= minimumLogLevel else { return }
        let timestamp = dateFormatter.string(from: Date())
        print("[\(level.rawValue)] [\(timestamp)]: \(message)")
    }
}
