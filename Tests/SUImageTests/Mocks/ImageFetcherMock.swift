//
//  ImageFetcherMock.swift
//
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

import XCTest
@testable import SUImage

class ImageFetcherMock: ImageFetching {
    var mockResult: Result<Data, ImageLoadingError>!

    func fetchImage(from url: URL) async -> Result<Data, ImageLoadingError> {
        mockResult
    }
}
