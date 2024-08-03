//
//  ImageFetching.swift
//
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

import Foundation

/// A protocol for fetching images from a URL.
public protocol ImageFetching {
    /// Fetches image data from the given URL asynchronously.
    ///
    /// - Parameter url: The URL to fetch the image data from.
    /// - Returns: A Result containing image data or an ImageLoadingError.
    func fetchImage(from url: URL) async -> Result<Data, ImageLoadingError>
}
