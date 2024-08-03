//
//  EntityMaker.swift
//
//
//  Created by Sinan Ulusoy on 3.08.2024.
//

import Foundation

enum EntityMaker {
    
    static func makeImageUrlEntity(
        url: String = "https://picsum.photos",
        width: Int = 5000,
        height: Int = 4500
    ) -> URL {
        URL(string: "/\(url)/\(width)/\(height)")!
    }
}
