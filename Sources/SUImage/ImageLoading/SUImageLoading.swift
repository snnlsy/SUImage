//
//  SUImageLoading.swift
//
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

import UIKit

/// A protocol for loading images which combines caching, fetching, processing, and compressing.
public protocol SUImageLoading: AnyObject {
    /// Loads an image from the given URL, optionally resizing it to the specified size.
    ///
    /// - Parameters:
    ///   - url: The URL to load the image from.
    ///   - size: An optional CGSize to resize the image.
    /// - Returns: A Result containing a UIImage or an SUImageLoadingError.
    func loadImage(from url: URL, size: CGSize?) async -> Result<UIImage, SUImageLoadingError>
    
    /// Clears the image cache.
    func clearCache()
    
    /// Fetches an image from the given URL.
    ///
    /// - Parameter url: The URL to fetch the image from.
    /// - Returns: An optional UIImage if the fetching is successful.
    func fetchImageFromURL(_ url: URL) async -> UIImage?
}
