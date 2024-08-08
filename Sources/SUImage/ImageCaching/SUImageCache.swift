//
//  SUImageCache.swift
//  
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

import UIKit

/// Class for caching images using NSCache.
public class SUImageCache: SUImageCaching {
    private let cache: NSCache<NSString, UIImage>

    public init(
        memoryLimit: Int = 50 * 1024 * 1024,
        countLimit: Int = 100
    ) {
        cache = NSCache<NSString, UIImage>()
        cache.totalCostLimit = memoryLimit
        cache.countLimit = countLimit
    }

    public func setObject(
        _ image: UIImage,
        forKey key: String
    ) {
        cache.setObject(image, forKey: key as NSString)
    }

    public func object(forKey key: String) -> UIImage? {
        cache.object(forKey: key as NSString)
    }

    public func removeAllObjects() {
        cache.removeAllObjects()
    }
}
