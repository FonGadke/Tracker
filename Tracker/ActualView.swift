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
                    leading: EditButton()
//                  trailing: NavigationLink(destination: CreateNewTaskView()){
//                  Image(systemName: "plus")
//                  }
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
                    HStack {
                        Text(task.title!)
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("\(task.time!, formatter: dateFormatter)")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                        }
                    }
                }
            }
            .onDelete { indices in
                self.tasks.delete(at: indices, from: self.viewContext)
            }
        }
    }
}

private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .none
    return dateFormatter
}()

struct ActualView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return ActualView().environment(\.managedObjectContext, context)
    }
}

