//
//  AddPersonView.swift
//  iRemember
//
//  Created by Matheus Viana on 24/05/23.
//

import SwiftUI

struct AddPersonView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var people: People

    @State var name: String = ""
    @State var inputImage: UIImage?
    @State var image: Image?
    @State private var isShowingPicker = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("What's their name?", text: $name)
                }
                
                Section {
                    Button("How's their face") {
                        isShowingPicker = true
                    }
                }
                
                if name.count > 0 && image != nil {
                    Section("Info to be saved") {
                        Text("Name to be reminded \(name)")
                        image?
                            .resizable()
                            .scaledToFit()
                        
                        Button("Add") {
                            save()
                        }
                    }
                }
            }
            .navigationTitle("Add new contact")
            .sheet(isPresented: $isShowingPicker) {
                ImagePicker(image: $inputImage)
            }
            .onChange(of: inputImage) { _ in loadImage() }
            .toolbar {
                Button("Cancel", role: .cancel) {
                    dismiss()
                }
            }
        }
    }
    
    func loadImage() {
        guard let addedImage = inputImage else {
            return
        }
        
        image = Image(uiImage: addedImage)
    }
    
    func save() {
        guard let imageToBeSaved = inputImage else {
            return
        }
        
        let imgSaver = ImageSaver()
        
        imgSaver.successHandler = {
            print("Success!")
        }
        
        imgSaver.errorHandler = {
            print("Ooops! \($0.localizedDescription)")
        }
        
        let newPerson = Person(name: name, image: imageToBeSaved)
        
        imgSaver.writeData(image: imageToBeSaved, personName: newPerson.name)
        
        people.people.append(newPerson)
        
        dismiss()
    }
}

struct AddPersonView_Previews: PreviewProvider {
    static let person = Person.generateStaticData()
    static var previews: some View {
        AddPersonView(people: People(), name: person.name, inputImage: person.uiImage)
    }
}
