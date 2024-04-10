//
//  AvailabilityWeekDayComponentIView.swift
//  MondayTraining
//
//  Created by Henrique Guimarães on 08/02/2024.
//

import SwiftUI

struct AvailabilityWeekDayComponentIView: View {
    @State var isPresentingActivityView = false
    @Binding var weekDay: WeekDay
   
    var body: some View {
        VStack(alignment: .leading){
            Text(weekDay.dayName)
            HStack{
                Button(action: {
                    isPresentingActivityView = true
                }){
                    Label("Tipo de actividades", systemImage: "figure.run.circle")
                        .foregroundColor(Color("serlima"))
                }
                TextField("tempo em minutos", value: $weekDay.timeAvailable, formatter: Formatter.lucNumberFormat)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
            }
        }
        .sheet(isPresented: $isPresentingActivityView){
            NavigationStack{
                AvailabilityActivitiesView(weekDay: $weekDay)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingActivityView = false
                            }
                        }
                        
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingActivityView = false
                            }
                        }
                    }
            }
        }
    }
}

struct AvailabilityWeekDayComponentIView_Previews: PreviewProvider {
    static var previews: some View {
        AvailabilityWeekDayComponentIView(weekDay: .constant(WeekDay(dayName: "Terça-Feira")))
            .previewLayout(.sizeThatFits)
    }
}
