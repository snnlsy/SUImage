//
//  ImageCachingMock.swift
//
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

import XCTest
@testable import SUImage

class ImageCacheMock: ImageCaching {
    var mockImage: UIImage?
    var isRemoveAllObjectsCalled = false

    func setObject(_ image: UIImage, forKey key: String) {}

    func object(forKey key: String) -> UIImage? {
        mockImage
    }

    func removeAllObjects() {
        isRemoveAllObjectsCalled = true
    }
}
