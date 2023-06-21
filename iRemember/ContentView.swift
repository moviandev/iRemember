//
//  ContentView.swift
//  iRemember
//
//  Created by Matheus Viana on 16/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var people: [Person] = []
    @State private var showingAddSheet = false
    
    let savedPeople = FileManager.documentDirectory.appendingPathComponent("People")
    
    init() {
        do {
            let data = try Data(contentsOf: savedPeople)
            print(data)
            people = try JSONDecoder().decode([Person].self, from: data)
        } catch {
            print("error")
            people = []
        }
    }
    
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
                    showingAddSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                AddPersonView()
            }
            .onAppear {
                do {
                    let data = try Data(contentsOf: savedPeople)
                    print(data)
                    people = try JSONDecoder().decode([Person].self, from: data)
                } catch {
                    print("error")
                    people = []
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
