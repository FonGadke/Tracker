//
//  SceneDelegate.swift
//  Tracker
//
//  Created by Кирилл Чулков on 04.03.2020.
//  Copyright © 2020 Кирилл Чулков. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        // Get the managed object context from the shared persistent container.
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let subjectP0 = Subject(context: context)
        subjectP0.id = UUID()
        subjectP0.name = "Параллельное скатывание с горы"

        let subjectP1 = Subject(context: context)
        subjectP1.id = UUID()
        subjectP1.name = "Теория теорий"

        let subjectP2 = Subject(context: context)
        subjectP2.id = UUID()
        subjectP2.name = "Математическая математика"

        let subjectP3 = Subject(context: context)
        subjectP3.id = UUID()
        subjectP3.name = "Алгоритмы и структуры подземелий"

        let subjectP4 = Subject(context: context)
        subjectP4.id = UUID()
        subjectP4.name = "Операционные операции"

        let subjectP5 = Subject(context: context)
        subjectP5.id = UUID()
        subjectP5.name = "Архитектура зданий"

        let day0 = Day(context: context)
        day0.id = UUID()
        day0.name = "Понедельник"
        day0.number = 0

        let day1 = Day(context: context)
        day1.id = UUID()
        day1.name = "Вторник"
        day1.number = 1

        let day2 = Day(context: context)
        day2.id = UUID()
        day2.name = "Среда"
        day2.number = 2

        let day3 = Day(context: context)
        day3.id = UUID()
        day3.name = "Четверг"
        day3.number = 3

        let day4 = Day(context: context)
        day4.id = UUID()
        day4.name = "Пятница"
        day4.number = 4

        let day5 = Day(context: context)
        day5.id = UUID()
        day5.name = "Суббота"
        day5.number = 5

        let day6 = Day(context: context)
        day6.id = UUID()
        day6.name = "Воскресенье"
        day6.number = 6

        let lesson00 = Lesson(context: context)
        lesson00.id = UUID()
        lesson00.classroom = "146"
        lesson00.startTime = "8:20"
        lesson00.endTime = "18:30"
        lesson00.teacher = "Чулков Кирилл Викторович"
        lesson00.name = subjectP0
        lesson00.day = day0

        let lesson01 = Lesson(context: context)
        lesson01.id = UUID()
        lesson01.classroom = "146"
        lesson01.startTime = "18:50"
        lesson01.endTime = "20:20"
        lesson01.teacher = "Чулков Кирилл Викторович"
        lesson01.name = subjectP0
        lesson01.day = day0

        let lesson10 = Lesson(context: context)
        lesson10.id = UUID()
        lesson10.classroom = "2048"
        lesson10.startTime = "8:20"
        lesson10.endTime = "9:50"
        lesson10.teacher = "Плетнева Мария"
        lesson10.name = subjectP1
        lesson10.day = day1

        let lesson11 = Lesson(context: context)
        lesson11.id = UUID()
        lesson11.classroom = "2048"
        lesson11.startTime = "10:00"
        lesson11.endTime = "11:30"
        lesson11.teacher = "Плетнева Мария"
        lesson11.name = subjectP1
        lesson11.day = day1

        let lesson12 = Lesson(context: context)
        lesson12.id = UUID()
        lesson12.classroom = "456"
        lesson12.startTime = "11:40"
        lesson12.endTime = "13:10"
        lesson12.teacher = "Ильдар"
        lesson12.name = subjectP2
        lesson12.day = day1

        let lesson13 = Lesson(context: context)
        lesson13.id = UUID()
        lesson13.classroom = "100"
        lesson13.startTime = "17:00"
        lesson13.endTime = "18:30"
        lesson13.teacher = "Трапезников Семен"
        lesson13.name = subjectP3
        lesson13.day = day1

        let lesson30 = Lesson(context: context)
        lesson30.id = UUID()
        lesson30.classroom = "2048"
        lesson30.startTime = "10:00"
        lesson30.endTime = "11:30"
        lesson30.teacher = "Плетнева Мария"
        lesson30.name = subjectP1
        lesson30.day = day3

        let lesson31 = Lesson(context: context)
        lesson31.id = UUID()
        lesson31.classroom = "2048"
        lesson31.startTime = "11:40"
        lesson31.endTime = "13:10"
        lesson31.teacher = "Плетнева Мария"
        lesson31.name = subjectP1
        lesson31.day = day3

        let lesson32 = Lesson(context: context)
        lesson32.id = UUID()
        lesson32.classroom = "2048"
        lesson32.startTime = "13:30"
        lesson32.endTime = "15:00"
        lesson32.teacher = "Плетнева Мария"
        lesson32.name = subjectP1
        lesson32.day = day3

        let lesson33 = Lesson(context: context)
        lesson33.id = UUID()
        lesson33.classroom = "2048"
        lesson33.startTime = "15:20"
        lesson33.endTime = "16:50"
        lesson33.teacher = "Плетнева Мария"
        lesson33.name = subjectP2
        lesson33.day = day3

        let lesson40 = Lesson(context: context)
        lesson40.id = UUID()
        lesson40.classroom = "128"
        lesson40.startTime = "6:30"
        lesson40.endTime = "8:00"
        lesson40.teacher = "Никита"
        lesson40.name = subjectP4
        lesson40.day = day4

        let lesson41 = Lesson(context: context)
        lesson41.id = UUID()
        lesson41.classroom = "128"
        lesson41.startTime = "18:40"
        lesson41.endTime = "20:10"
        lesson41.teacher = "Никита"
        lesson41.name = subjectP4
        lesson41.day = day4

        let lesson50 = Lesson(context: context)
        lesson50.id = UUID()
        lesson50.classroom = "281"
        lesson50.startTime = "20:20"
        lesson50.endTime = "21:50"
        lesson50.teacher = "Трапезников Семен"
        lesson50.name = subjectP5
        lesson50.day = day5

        let lesson51 = Lesson(context: context)
        lesson51.id = UUID()
        lesson51.classroom = "281"
        lesson51.startTime = "22:00"
        lesson51.endTime = "23:30"
        lesson51.teacher = "Трапезников Семен"
        lesson51.name = subjectP5
        lesson51.day = day5

        let lesson52 = Lesson(context: context)
        lesson52.id = UUID()
        lesson52.classroom = "281"
        lesson52.startTime = "23:40"
        lesson52.endTime = "1:20"
        lesson52.teacher = "Трапезников Семен"
        lesson52.name = subjectP5
        lesson52.day = day5
        
        // Create the SwiftUI view and set the context as the value for the managedObjectContext environment keyPath.
        // Add `@Environment(\.managedObjectContext)` in the views that will need the context.
        let contentView = ContentView().environment(\.managedObjectContext, context)
        
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        
        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    
}

