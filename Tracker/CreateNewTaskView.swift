//
//  CreateNewTaskView.swift
//  Tracker
//
//  Created by Кирилл Чулков on 04.03.2020.
//  Copyright © 2020 Кирилл Чулков. All rights reserved.
//

import SwiftUI

struct CreateNewTaskView: View {
    @Environment(\.managedObjectContext)
    var viewContext
    
    @Environment(\.presentationMode)
    var mode: Binding<PresentationMode>
    
    var subject: Subject? = nil
    
    @State var title: String = ""
    @State var content: String = ""
    @State var data: Date = Date()
    @State var chosenSubject = 0
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Subject.name, ascending: true)],
        animation: .default)
    var subjects: FetchedResults<Subject>
    
    func initChosenSubject() -> Void {
        if (subject != nil) {
            for i in 0...(self.subjects.count - 1) {
                if subject == self.subjects[i] {
                    chosenSubject = i
                    return
                }
            }
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General information")) {
                    Picker(selection: $chosenSubject, label: Text("Предмет")) {
                        ForEach(0 ..< subjects.count) {
                            Text(self.subjects[$0].name!)
                        }
                    }
                    DatePicker(selection: $data,
                               in: Date()...,
                               displayedComponents: .date,
                               label: { Text("Дата") })
                }
                Section(header: Text("About")) {
                    TextField("Название", text: $title)
                    TextField("Заметка", text: $content)
                }
                Section {
                    Button(action: {
                        if (self.title != "") {
                            Task.create(subject: self.subjects[self.chosenSubject], time: self.data, title: self.title, content: self.content, in: self.viewContext)
                        }
                        self.mode.wrappedValue.dismiss()
                    }) {
                        Text("OK")
                    }
                }
            }
            .navigationBarTitle(Text("Новая задача"))
        }.onAppear {
            self.initChosenSubject()
        }
    }
}

struct CreateNewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewTaskView()
    }
}
