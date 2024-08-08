
# SUImage

SUImage is a comprehensive image loading, caching, processing, and compressing library for iOS, built with modularity and ease of use in mind. This library provides everything needed to asynchronously load images from the web, process them (e.g., resizing), compress them for optimal performance, and cache them for efficient retrieval.

## Features

*   Asynchronous image loading with a simple API.
*   Image caching using `NSCache`.
*   Image resizing and processing.
*   Image compression to reduce memory usage.
*   Modular components that can be easily swapped or customized.
*   Logging support to track and debug operations.

## Installation

### Swift Package Manager

Add the following dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/snnlsy/SUImage.git", from: "1.0.0")
]
```

Then, include `SUImage` in your target dependencies:

```swift
.target(
    name: "YourTargetName",
    dependencies: [
        .product(name: "SUImage", package: "SUImage")
    ]
)
```

## Usage

### Setup

First, import the SUImage library where you want to use it:

```swift
import SUImage
```

### UIImageView Extension

SUImage provides an extension for `UIImageView` to easily set images from a URL.

#### Example Usage

```swift
import SUImage

let imageURL = URL(string: "https://example.com/image.jpg")!
imageView.setImage(from: imageURL, placeholder: UIImage(named: "placeholder"))
```

### Customizing SUImageLoader

You can customize the components used by `SUImageLoader`:

```swift
let customCache: SUImageCaching = SUImageCache(memoryLimit: 100 * 1024 * 1024, countLimit: 200)
let customFetcher: SUImageFetching = SUImageFetcher(session: URLSession.shared)
let customCompressor: SUImageCompressing = SUImageCompressor(quality: 0.8)
let customProcessor: SUImageProcessing = SUImageProcessor()
let customLogger = SUConsoleLogger(minimumLogLevel: .debug)

let customImageLoader = SUImageLoader(
    cache: customCache,
    fetcher: customFetcher,
    compressor: customCompressor,
    processor: customProcessor,
    logger: customLogger
)

imageView.imageLoader = customImageLoader
```

### Clearing the Cache

To clear the image cache:

```swift
imageLoader.clearCache()
```

### Logging

SUImage includes logging functionality to help you debug and monitor image loading operations. You can set the minimum log level to control the verbosity.

```swift
let logger = SUConsoleLogger(minimumLogLevel: .info)
logger.log("This is an info message", level: .info)
```

## Components

### UIImageView+Extension

This extension provides methods to load images asynchronously, handle placeholders, and manage image loading tasks.

### SUImageCache

A class for caching images using `NSCache`.

### SUImageProcessor

A class for processing images, such as resizing.

### SUImageLoader

A class that combines caching, fetching, processing, and compressing functionalities to load images.

### SUImageCompressor

A class for compressing images to reduce memory usage.

### SUConsoleLogger

A class for logging messages to the console.

### Protocols

*   `SUImageCaching`: Defines caching functionality.
*   `SUImageProcessing`: Defines image processing functionality.
*   `SUImageLoading`: Defines image loading functionality.
*   `SUImageFetching`: Defines image fetching functionality.
*   `SUImageCompressing`: Defines image compressing functionality.
*   `SULogging`: Defines logging functionality.

### Error Handling

`SUImageLoadingError` enum provides error cases for various issues that can occur during image loading.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Author

Sinan Ulusoy

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss what you would like to change.
