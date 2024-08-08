//
//  SULogLevel.swift
//
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

/// Enumeration representing different levels of log severity.
public enum SULogLevel: String, Comparable {
    case debug = "🛠DEBUG"
    case info = "ℹ️INFO"
    case warning = "⚠️WARNING"
    case error = "❌ERROR"
    
    /// Compares two log levels based on their priority.
    public static func < (lhs: SULogLevel, rhs: SULogLevel) -> Bool {
        lhs.priority < rhs.priority
    }
    
    /// Priority value for the log levels.
    private var priority: Int {
        switch self {
        case .debug: 0
        case .info: 1
        case .warning: 2
        case .error: 3
        }
    }
}
