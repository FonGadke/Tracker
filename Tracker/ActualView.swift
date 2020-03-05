//
//  ActualView.swift
//  Tracker
//
//  Created by Кирилл Чулков on 04.03.2020.
//  Copyright © 2020 Кирилл Чулков. All rights reserved.
//

import SwiftUI

struct ActualView: View {
    @Environment(\.managedObjectContext)
    var viewContext
    
    var body: some View {
        NavigationView {
            MasterViewTask()
                .navigationBarTitle(Text("Актуальное"), displayMode: .inline)
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: NavigationLink(destination: CreateNewTaskView()){
                        Image(systemName: "plus")
                    }
            )
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct MasterViewTask: View {

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.time, ascending: true)],
        animation: .default)
    var tasks: FetchedResults<Task>
    
    @Environment(\.managedObjectContext)
    var viewContext
    
    var body: some View {
        List {
            ForEach(tasks, id: \.self) { task in
                NavigationLink(
                    destination: ChangeTaskView(task: task)
                ) {
                    Text(task.title!)
                }
            }
            .onDelete { indices in
                self.tasks.delete(at: indices, from: self.viewContext)
            }
        }
    }
}

struct ActualView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return ActualView().environment(\.managedObjectContext, context)
    }
}

