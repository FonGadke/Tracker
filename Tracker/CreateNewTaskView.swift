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
    @State var data: Data = Data()
    @State var chosenSubject = 2
    
    var subjects = ["парю прог", "пирог","лол кек", "С++", "парю прог", "пирог","лол кек", "С++"]
    //    let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
    
    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $chosenSubject, label: Text("Предмет")) {
                    ForEach(0 ..< subjects.count) {
                        Text(self.subjects[$0])
                    }
                }
                DatePicker(selection: .constant(Date()), label: { Text("Дата") })
                TextField("Название", text: $title)
                TextField("Заметка", text: $content)
                Button(action: {
                    self.mode.wrappedValue.dismiss()
                }) {
                    Text("OK")
                }
            }
            .navigationBarTitle(Text("Новая заметка"))
        }
    }
}

struct CreateNewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewTaskView()
    }
}
