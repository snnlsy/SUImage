//
//  ImageLoaderTests.swift
//
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

import XCTest
@testable import SUImage

final class ImageLoaderTests: XCTestCase {

    // MARK: - Private variables

    private var sut: ImageLoader!
    private var mockCache: ImageCacheMock!
    private var mockFetcher: ImageFetcherMock!
    private var mockCompressor: ImageCompressorMock!
    private var mockProcessor: ImageProcessorMock!
    private var mockLogger: LoggerMock!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
        mockCache = ImageCacheMock()
        mockFetcher = ImageFetcherMock()
        mockCompressor = ImageCompressorMock()
        mockProcessor = ImageProcessorMock()
        mockLogger = LoggerMock()
        sut = ImageLoader(
            cache: mockCache,
            fetcher: mockFetcher,
            compressor: mockCompressor,
            processor: mockProcessor,
            logger: mockLogger
        )
    }

    override func tearDown() {
        mockCache = nil
        mockFetcher = nil
        mockCompressor = nil
        mockProcessor = nil
        mockLogger = nil
        sut = nil
        super.tearDown()
    }

    // MARK: - Tests

    func test_loadImage_returns_cached_image_when_available() async {
        // Given
        let url = EntityMaker.makeImageUrlEntity()
        let cachedImage = UIImage(systemName: "star")!
        mockCache.mockImage = cachedImage

        // When
        let result = await sut.loadImage(from: url)

        // Then
        switch result {
        case .success(let image):
            XCTAssertEqual(image, cachedImage)
        case .failure:
            XCTFail("Expected success, but got failure")
        }
        XCTAssertTrue(mockLogger.loggedMessages.contains { $0.contains("Image found in cache") })
    }

    func test_loadImage_returns_failure_when_fetching_fails() async {
        // Given
        let url = EntityMaker.makeImageUrlEntity()
        mockFetcher.mockResult = .failure(.networkError(NSError(domain: "test", code: 0, userInfo: nil)))

        // When
        let result = await sut.loadImage(from: url)

        // Then
        switch result {
        case .success:
            XCTFail("Expected failure, but got success")
        case .failure(let error):
            XCTAssertEqual(error, .networkError(NSError(domain: "test", code: 0, userInfo: nil)))
        }
        XCTAssertTrue(mockLogger.loggedMessages.contains { $0.contains("Fetching image from URL") })
    }

    func test_clearCache_removes_all_objects() {
        // When
        sut.clearCache()

        // Then
        XCTAssertTrue(mockCache.isRemoveAllObjectsCalled)
        XCTAssertTrue(mockLogger.loggedMessages.contains { $0.contains("Image cache cleared") })
    }

    func test_fetchImageFromURL_returns_nil_on_failure() async {
        // Given
        let url = EntityMaker.makeImageUrlEntity()
        mockFetcher.mockResult = .failure(.invalidURL)

        // When
        let result = await sut.fetchImageFromURL(url)

        // Then
        XCTAssertNil(result)
        XCTAssertTrue(mockLogger.loggedMessages.contains { $0.contains("Failed to fetch image") })
    }
}
