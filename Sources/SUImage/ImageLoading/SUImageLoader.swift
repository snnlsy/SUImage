//
//  SUImageLoader.swift
//  
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

import UIKit

/// A class that combines various functionalities to load images.
public class SUImageLoader: SUImageLoading {

    public static let shared = SUImageLoader()

    private let cache: SUImageCaching
    private let fetcher: SUImageFetching
    private let compressor: SUImageCompressing
    private let processor: SUImageProcessing
    private let logger: SULogging

    public init(
        cache: SUImageCaching = SUImageCache(),
        fetcher: SUImageFetching = SUImageFetcher(),
        compressor: SUImageCompressing = SUImageCompressor(),
        processor: SUImageProcessing = SUImageProcessor(),
        logger: SULogging = SUConsoleLogger(minimumLogLevel: .error)
    ) {
        self.cache = cache
        self.fetcher = fetcher
        self.compressor = compressor
        self.processor = processor
        self.logger = logger
        logger.log("Initialized image loader with custom components", level: .info)
    }

    public func loadImage(
        from url: URL,
        size: CGSize? = nil
    ) async -> Result<UIImage, SUImageLoadingError> {
        let cacheKey = makeCacheKey(for: url, size: size)

        if let cachedImage = cache.object(forKey: cacheKey) {
            logger.log("Image found in cache for key: \(cacheKey)", level: .info)
            return .success(cachedImage)
        }

        logger.log("Fetching image from URL: \(url)", level: .debug)
        let fetchResult = await fetcher.fetchImage(from: url)
        let compressResult = fetchResult.flatMap { self.compressor.compress($0) }
        
        return compressResult.flatMap { data in
            guard let image = UIImage(data: data) else {
                logger.log("Failed to create image from data", level: .error)
                return .failure(.invalidData)
            }
            let processedImage = size.map { self.processor.resize(image, to: $0) } ?? image
            self.cache.setObject(processedImage, forKey: cacheKey)
            logger.log("Image processed and cached for key: \(cacheKey)", level: .info)
            return .success(processedImage)
        }
    }

    public func clearCache() {
        cache.removeAllObjects()
        logger.log("Image cache cleared", level: .info)
    }

    public func fetchImageFromURL(_ url: URL) async -> UIImage? {
        let result = await loadImage(from: url)
        switch result {
        case .success(let image):
            return image
        case .failure(let error):
            logger.log("Failed to fetch image: \(error.localizedDescription)", level: .error)
            return nil
        }
    }

    private func makeCacheKey(
        for url: URL,
        size: CGSize?
    ) -> String {
        if let size {
            return "\(url.absoluteString)-\(Int(size.width))x\(Int(size.height))"
        }
        return url.absoluteString
    }
}
