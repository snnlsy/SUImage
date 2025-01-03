//
//  ImageCompressingMock.swift
//  
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

import XCTest
@testable import SUImage

class ImageCompressorMock: SUImageCompressing {
    var mockResult: Result<Data, SUImageLoadingError>!

    func compress(_ image: UIImage, quality: CGFloat) -> Data? {
        nil
    }

    func compress(_ data: Data) -> Result<Data, SUImageLoadingError> {
        mockResult
    }
}
