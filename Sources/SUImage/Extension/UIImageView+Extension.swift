//
//  UIImageView+Extension.swift
//
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

import UIKit

/// Extension for UIImageView to load images asynchronously.
extension UIImageView {
    private struct AssociatedKeys {
        static var imageLoader = "imageLoader"
        static var imageLoadingTask = "imageLoadingTask"
    }

    /// The image loader instance used for loading images.
    public var imageLoader: ImageLoading? {
        get { objc_getAssociatedObject(self, &AssociatedKeys.imageLoader) as? ImageLoading }
        set { objc_setAssociatedObject(self, &AssociatedKeys.imageLoader, newValue, .OBJC_ASSOCIATION_RETAIN) }
    }

    /// The current image loading task, if any.
    private var imageLoadingTask: Task<Void, Never>? {
        get { objc_getAssociatedObject(self, &AssociatedKeys.imageLoadingTask) as? Task<Void, Never> }
        set { objc_setAssociatedObject(self, &AssociatedKeys.imageLoadingTask, newValue, .OBJC_ASSOCIATION_RETAIN) }
    }

      /// Sets the image directly to the UIImageView on the main thread.
      ///
      /// - Parameter image: The UIImage to set.
      @MainActor
      public func setImage(image: UIImage) {
          cancelImageLoading()
          self.image = image
      }


    /// Loads an image from a URL and sets it to the UIImageView.
    ///
    /// - Parameters:
    ///   - url: The URL to load the image from.
    ///   - placeholder: An optional placeholder image to display while loading.
    ///   - size: An optional size to resize the image.
    ///   - errorImage: An optional image to display if loading fails.
    @MainActor
    public func setImage(
        from url: URL,
        placeholder: UIImage? = nil,
        size: CGSize? = nil,
        errorImage: UIImage? = nil
    ) {
        guard let imageLoader = self.imageLoader else {
            print("ImageLoader not set. Please set an ImageLoader instance before calling setImage.")
            return
        }

        cancelImageLoading()

        self.image = placeholder

        imageLoadingTask = Task {
            let result = await imageLoader.loadImage(from: url, size: size)
            if !Task.isCancelled {
                await MainActor.run {
                    switch result {
                    case .success(let image):
                        self.image = image
                    case .failure(let error):
                        print("Failed to load image: \(error.localizedDescription)")
                        self.image = errorImage
                    }
                }
            }
        }
    }

    /// Cancels the current image loading task.
    public func cancelImageLoading() {
        imageLoadingTask?.cancel()
        imageLoadingTask = nil
    }
}
