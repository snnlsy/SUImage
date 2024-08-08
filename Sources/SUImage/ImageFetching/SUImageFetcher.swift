//
//  SUImageFetcher.swift
//  
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

import Foundation

/// An actor class for fetching images asynchronously.
public actor SUImageFetcher: SUImageFetching {
    private let session: URLSession

    public init(session: URLSession = .shared) {
        self.session = session
    }

    public func fetchImage(from url: URL) async -> Result<Data, SUImageLoadingError> {
        do {
            let (data, _) = try await session.data(from: url)
            return .success(data)
        } catch {
            return .failure(.networkError(error))
        }
    }
}
