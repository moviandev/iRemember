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
    let image: Data
    
    func generateStaticData() -> Person {
        Person(name: "Matheus", image: Data())
    }
}
