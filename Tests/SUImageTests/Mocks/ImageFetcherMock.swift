//
//  ImageFetcherMock.swift
//
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

import XCTest
@testable import SUImage

class ImageFetcherMock: SUImageFetching {
    var mockResult: Result<Data, SUImageLoadingError>!

    func fetchImage(from url: URL) async -> Result<Data, SUImageLoadingError> {
        mockResult
    }
}
