//
//  SUImageProcessor.swift
//  
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

import UIKit

/// Class for processing images, such as resizing.
public class SUImageProcessor: SUImageProcessing {
    public init() {}

    public func resize(
        _ image: UIImage,
        to size: CGSize
    ) -> UIImage {
        UIGraphicsImageRenderer(size: size).image { _ in
            image.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
