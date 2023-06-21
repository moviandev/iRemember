//
//  People.swift
//  iRemember
//
//  Created by Matheus Viana on 21/06/23.
//

import Foundation

class People: ObservableObject {
    let savedPeople = FileManager.documentDirectory.appendingPathComponent("People")

    @Published var people: [Person] = []
        
    init() {
        do {
            let data = try Data(contentsOf: savedPeople)
            print(data)
            let person = try JSONDecoder().decode(Person.self, from: data)
            people.append(person)
        } catch {
            print("error")
            people = []
        }
    }
}
