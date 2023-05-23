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
    
    func generateStaticData() -> Person {
        let image = UIImage(systemName: "exclamationmark.triangle.fill")?.jpegData(compressionQuality: 0.8)
        return Person(name: "Matheus", imageData: image!)
    }
    
    var image: Image {
        guard let uiImage = UIImage(data: imageData) else {
            return Image(systemName: "exclamationmark.triangle.fill")
        }
        
        return Image(uiImage: uiImage)
    }
}
