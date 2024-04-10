//
//  AvailabilityActivitiesView.swift
//  MondayTraining
//
//  Created by Henrique Guimarães on 08/02/2024.
//

import SwiftUI

struct AvailabilityActivitiesView: View {
    @Binding var weekDay: WeekDay
    
    var body: some View {
        VStack{
            List($weekDay.activities){ activities in
                Toggle(isOn: activities.isAvailable){
                    
                    Label{
                        Text(activities.activityName.wrappedValue)
                    } icon: {
                        Image(systemName: activities.imageName.wrappedValue)
                            .foregroundColor(Color("serlima"))
                    }
                }
                }
            }
        }
    }
    
    struct AvailabilityActivitiesView_Previews: PreviewProvider {
        static var previews: some View {
            AvailabilityActivitiesView(weekDay: .constant(WeekDay(dayName: "Terça-Feira")))
        }
    }

