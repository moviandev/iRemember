//
//  ContentView.swift
//  iRemember
//
//  Created by Matheus Viana on 16/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var people: [Person] = [Person.generateStaticData()]
    
    var body: some View {
        NavigationView {
            VStack {
                List(people) { person in
                    NavigationLink {
                        person.image
                    } label: {
                        HStack {
                            person.image
                                .resizable()
                                .frame(width: 45, height: 40)
                                .clipShape(Circle())
                            Text(person.name)
                                .foregroundColor(.primary)
                                .font(.headline)
                        }
                    }
                }
            }
            .navigationTitle("iRemember")
            .toolbar {
                Button {
                    // implement showing sheets here
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
