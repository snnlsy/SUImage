//
//  Logging.swift
//
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

/// A protocol for logging messages with different levels of severity.
public protocol Logging {
    /// Logs a message with the specified log level.
    ///
    /// - Parameters:
    ///   - message: The message to be logged.
    ///   - level: The log level of the message.
    func log(_ message: String, level: LogLevel)
}
