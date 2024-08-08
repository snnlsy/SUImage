//
//  SUImageProcessing.swift
//
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

import UIKit

/// A protocol that defines image resizing functionality.
public protocol SUImageProcessing {
    /// Resizes the given image to the specified size.
    ///
    /// - Parameters:
    ///   - image: The UIImage to be resized.
    ///   - size: The desired size to resize the image to.
    /// - Returns: A resized UIImage.
    func resize(_ image: UIImage, to size: CGSize) -> UIImage
}
