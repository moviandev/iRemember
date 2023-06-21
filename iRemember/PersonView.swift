//
//  PersonView.swift
//  iRemember
//
//  Created by Matheus Viana on 21/06/23.
//

import SwiftUI

struct PersonView: View {
    @State var person: Person
    
    var body: some View {
        Form {
            Section("Name") {
                Text(person.name)
            }
            
            Section("Contact face") {
                person
                    .image
                    .resizable()
                    .scaledToFit()
            }
            .navigationTitle("Contact Info")
        }
    }
}
