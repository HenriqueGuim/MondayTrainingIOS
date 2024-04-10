//
//  Util.swift
//  MondayTraining
//
//  Created by Henrique Guimarães on 06/02/2024.
//

import Foundation

func convertMinutesToTime(time : Int)-> String{
    let hours = time/60
    let minutes = time%60
    return "\(hours):\(minutes)"
}

func checkIfHasActivityTypes(activities: [WeekDay.Activity]) -> Bool{
    for activitie in activities{
        if activitie.isAvailable{
            return true
        }
    }
    return false
}

func getActivitiesStr(activities: [WeekDay.Activity]) -> String{
    var str = ""
    
    for activitie in activities{
        if activitie.isAvailable{
            str += " \(activitie.activityName),"
        }
    }
    
    return str.replacing(/,$/, with: "")
}
