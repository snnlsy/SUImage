//
//  ImageCompressingMock.swift
//  
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

import XCTest
@testable import SUImage

class ImageCompressorMock: ImageCompressing {
    var mockResult: Result<Data, ImageLoadingError>!

    func compress(_ image: UIImage, quality: CGFloat) -> Data? {
        nil
    }

    func compress(_ data: Data) -> Result<Data, ImageLoadingError> {
        mockResult
    }
}
