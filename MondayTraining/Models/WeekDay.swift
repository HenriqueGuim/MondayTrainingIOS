//
//  WeekDay.swift
//  MondayTraining
//
//  Created by Henrique Guimarães on 08/02/2024.
//

import Foundation
struct WeekDay: Identifiable{
    var id: UUID
    var dayName: String
    var timeAvailable: Int
    var activities: [Activity]
    
    init(id: UUID = UUID(), dayName: String, timeAvailable: Int = 0, activities: [Activity] = [
        Activity(activityName: "Btt", imageName: "mountain.2"),
        Activity(activityName: "Estrada", imageName: "figure.outdoor.cycle"),
        Activity(activityName: "Rolo", imageName: "figure.indoor.cycle"),
        Activity(activityName: "Corrida", imageName: "figure.run"),
        Activity(activityName: "Trail", imageName: "figure.run"),
        Activity(activityName: "Passadeira", imageName: "figure.run.circle"),
        Activity(activityName: "Natação", imageName: "figure.pool.swim"),
        Activity(activityName: "Ginásio", imageName: "dumbbell"),
    ]) {
        self.id = id
        self.dayName = dayName
        self.timeAvailable = timeAvailable
        self.activities = activities
    }
}

extension WeekDay{
    struct Activity: Identifiable{
        var id: UUID
        var activityName: String
        var isAvailable: Bool
        var imageName: String
        
        init(id: UUID = UUID(), activityName: String, isAvailable: Bool = false, imageName: String) {
            self.id = id
            self.activityName = activityName
            self.isAvailable = isAvailable
            self.imageName = imageName
        }
    }
}
