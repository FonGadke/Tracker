//
//  ContentView.swift
//  Tracker
//
//  Created by Кирилл Чулков on 04.03.2020.
//  Copyright © 2020 Кирилл Чулков. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ActualView()
                .tabItem {
                    Image(systemName: "flame")
                    Text("Актуальное")
            }
            TimeTableView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Расписание")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return ContentView().environment(\.managedObjectContext, context)
    }
}
