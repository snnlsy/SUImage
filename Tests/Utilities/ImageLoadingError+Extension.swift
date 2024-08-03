//
//  ImageLoadingError+Extension.swift
//
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

@testable import SUImage

/// Equatable conformance to compare two ImageLoadingError instances.
extension ImageLoadingError: Equatable {
    public static func == (lhs: ImageLoadingError, rhs: ImageLoadingError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidURL, .invalidURL),
             (.invalidData, .invalidData),
             (.compressionFailed, .compressionFailed):
            return true
        case (.networkError(let lhsError), .networkError(let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        default:
            return false
        }
    }
}
