//
//  Person.swift
//  iRemember
//
//  Created by Matheus Viana on 17/05/23.
//

import Foundation

struct Person: Codable, Identifiable {
    var id: UUID = UUID()
    let name: String
    let imagePath: String
    
    func generateStaticData() -> Person {
        Person(name: "Matheus", imagePath: "fakepath")
    }
}
