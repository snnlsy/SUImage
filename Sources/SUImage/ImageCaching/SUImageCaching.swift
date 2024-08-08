//
//  SUImageCaching.swift
//
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

import UIKit

/// A protocol for image caching functionality.
public protocol SUImageCaching: AnyObject {
    /// Caches the given image with the specified key.
    ///
    /// - Parameters:
    ///   - image: The UIImage to be cached.
    ///   - key: A string key for retrieving the cached image.
    func setObject(_ image: UIImage, forKey key: String)
    
    /// Retrieves the cached image for the given key.
    ///
    /// - Parameter key: The key to look up the cached image.
    /// - Returns: An optional UIImage if found in the cache.
    func object(forKey key: String) -> UIImage?
    
    /// Removes all images from the cache.
    func removeAllObjects()
}
