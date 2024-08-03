//
//  ImageProcessingMock.swift
//  
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

import XCTest
@testable import SUImage

class ImageProcessorMock: ImageProcessing {
    var mockImage: UIImage?

    func resize(_ image: UIImage, to size: CGSize) -> UIImage {
        mockImage ?? UIImage()
    }
}
