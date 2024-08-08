//
//  SUImageCompressor.swift
//  
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

import UIKit

/// Class for compressing images.
public class SUImageCompressor: SUImageCompressing {
    private let quality: CGFloat

    public init(quality: CGFloat = 0.7) {
        self.quality = quality
    }

    public func compress(
        _ image: UIImage,
        quality: CGFloat
    ) -> Data? {
        image.jpegData(compressionQuality: quality)
    }

    public func compress(_ data: Data) -> Result<Data, SUImageLoadingError> {
        guard let image = UIImage(data: data),
              let compressedData = compress(image, quality: quality) else {
            return .failure(.compressionFailed)
        }
        return .success(compressedData)
    }
}
