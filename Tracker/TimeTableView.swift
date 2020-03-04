//
//  TimeTableView.swift
//  Tracker
//
//  Created by Кирилл Чулков on 04.03.2020.
//  Copyright © 2020 Кирилл Чулков. All rights reserved.
//

import SwiftUI

struct TimeTableView: View {
    @Environment(\.managedObjectContext)
    var viewContext
    
    var body: some View {
        NavigationView {
            WeeksView()
                .accentColor(Color.primary)
                .navigationBarTitle(Text("Расписание"))
        }
    }
}

struct WeeksView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Day.number, ascending: true)],
        animation: .default)
    var days: FetchedResults<Day>
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(days, id: \.self) {day in
                    WeekDay(day: day)
                }
            }
            .padding(.all)
        }
    }
}

struct WeekDay: View {
    let day: Day
    
    var body: some View {
        let lessons = day.lessons!.allObjects as! [Lesson]
        return
            VStack {
                HStack {
                    Text(day.name!)
                    Spacer()
                }
                .padding(.bottom, 5)
                VStack(alignment: .leading) {
                    ForEach(lessons, id: \.self) { lesson in
                        ForEachBuilder {
                            SubjectRow(lesson: lesson)
                                .padding(.horizontal, 5)
                            Divider()
                        }
                    }
                }
                .padding(.top, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 1)
                )
        }
    }
}

struct ForEachBuilder<Content>: View where Content: View {
    
    private let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
    }
    
}

struct SubjectRow: View {
    let lesson: Lesson
    var body: some View {
        return NavigationLink(destination: Text(lesson.name!.name!)) {
            VStack {
                Text(lesson.startTime!)
                Image(systemName: "clock")
                Text(lesson.endTime!)
            }
            VStack(alignment: .leading) {
                Text(lesson.name!.name!)
                    .font(.headline)
                Text(lesson.teacher!)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                Text("Ауд. 322")
            }
            Spacer()
        }
    }
}

struct TimeTableView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return TimeTableView().environment(\.managedObjectContext, context)
    }
}
