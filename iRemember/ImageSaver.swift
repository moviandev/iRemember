//
//  ImageSaver.swift
//  iRemember
//
//  Created by Matheus Viana on 22/05/23.

import UIKit

class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    let savedPath = FileManager.documentDirectory.appendingPathComponent("People")
    
    func writeData(image: UIImage, personName: String) {
        let person = Person(name: personName, image: image)
        
        do {
            let encodedData = try JSONEncoder().encode(person);
            try encodedData.write(to: savedPath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Error saving data")
        }
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
