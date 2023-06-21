//
//  Person.swift
//  iRemember
//
//  Created by Matheus Viana on 17/05/23.
//

import SwiftUI
import Foundation

struct Person: Codable, Identifiable {
    var id: UUID = UUID()
    let name: String
    let imageData: Data
    
    static func generateStaticData() -> Person {
        let image = UIImage(systemName: "exclamationmark.triangle.fill")
        return Person(name: "Matheus", image: image!)
    }
    
    var image: Image {
        guard let uiImage = UIImage(data: imageData) else {
            return Image(systemName: "exclamationmark.triangle.fill")
        }
        
        return Image(uiImage: uiImage)
    }
    
    var uiImage: UIImage? {
        guard let uiImage = UIImage(data: imageData) else {
            return UIImage(systemName: "exclamationmark.triangle.fill")
        }
        
        return uiImage
    }
    
    init(name: String, image: UIImage) {
        self.name = name
        self.imageData = image.jpegData(compressionQuality: 0.8)!
    }
}
