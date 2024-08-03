//
//  ImageCompressing.swift
//  
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

import UIKit

/// A protocol for image compression functionality.
public protocol ImageCompressing {
    /// Compresses the given UIImage to the specified quality.
    ///
    /// - Parameters:
    ///   - image: The UIImage to be compressed.
    ///   - quality: A CGFloat representing the quality of the compression (0.0 to 1.0).
    /// - Returns: Optional compressed Data of the image.
    func compress(_ image: UIImage, quality: CGFloat) -> Data?
    
    /// Compresses the given image data.
    ///
    /// - Parameter data: The image data to be compressed.
    /// - Returns: A Result containing compressed data or an ImageLoadingError.
    func compress(_ data: Data) -> Result<Data, ImageLoadingError>
}
