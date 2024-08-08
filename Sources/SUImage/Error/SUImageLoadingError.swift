//
//  SUImageLoadingError.swift
//
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

import Foundation

/// Enumeration representing errors that can occur during image loading.
public enum SUImageLoadingError: Error, LocalizedError {
    case invalidURL
    case invalidData
    case compressionFailed
    case networkError(Error)

    /// Provides a description for each error case.
    public var errorDescription: String? {
        switch self {
        case .invalidURL: "Invalid URL provided."
        case .invalidData: "Failed to create image from data."
        case .compressionFailed: "Failed to compress image."
        case .networkError(let error): "Network error: \(error.localizedDescription)"
        }
    }
}
