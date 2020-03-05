//
//  ChangeTaskView.swift
//  Tracker
//
//  Created by Кирилл Чулков on 04.03.2020.
//  Copyright © 2020 Кирилл Чулков. All rights reserved.
//

import SwiftUI

struct ChangeTaskView: View {
    @Environment(\.managedObjectContext)
    var viewContext
    
    @Environment(\.presentationMode)
    var mode: Binding<PresentationMode>
    
    var task: Task
    
    @State var title: String = ""
    @State var content: String = ""
    @State var data: Date = Date()
    @State var chosenSubject = 0
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Subject.name, ascending: true)],
        animation: .default)
    var subjects: FetchedResults<Subject>
    
    func initChosenSubject() -> Void {
        for i in 0...(self.subjects.count - 1) {
            if task.subject! == self.subjects[i] {
                chosenSubject = i
                return
            }
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $chosenSubject, label: Text("Предмет")) {
                    ForEach(0 ..< subjects.count) {
                        Text(self.subjects[$0].name!)
                    }
                }
                DatePicker(selection: $data,
                           in: Date()...,
                           displayedComponents: .date,
                           label: { Text("Дата") })
                TextField("Название", text: $title)
                TextField("Заметка", text: $content)
                Button(action: {
                    if (self.title != "") {
                        self.task.title = self.title
                        self.task.descript = self.content
                        self.task.time = self.data
                        self.task.subject = self.subjects[self.chosenSubject]
                    }
                    self.mode.wrappedValue.dismiss()
                }) {
                    Text("OK")
                }
            }
            .navigationBarTitle(Text("Изменить задачу"))
        }
        .onAppear {
            self.initChosenSubject()
            self.title = self.task.title!
            self.content = self.task.descript!
            self.data = self.task.time!
        }
    }
}

struct ChangeTaskView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeTaskView(task: Task())
    }
}
