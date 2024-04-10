//
//  AvailabilityView.swift
//  MondayTraining
//
//  Created by Henrique Guimarães on 08/02/2024.
//

import SwiftUI

struct AvailabilityView: View {
    var mondayTrain: MondayTrainingType
    @State var mondayRest = false
    @State var weekDays = [WeekDay(dayName: "Terça-Feira"),
                           WeekDay(dayName: "Quarta-Feira"),
                           WeekDay(dayName: "Quinta-Feira"),
                           WeekDay(dayName: "Sexta-Feira"),
                           WeekDay(dayName: "Sábado")
    ]
    @State var shareMessage: shareText? = shareText(text: "")
    @State var isToShare = false
    @State var errorMessage = ""
    @FocusState private var isFirstResponder :Bool
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text("Segunda-Feira")
                Toggle("Descanso", isOn: $mondayRest)
            }
            
            ForEach($weekDays) { $day in
                AvailabilityWeekDayComponentIView(weekDay: $day)
                    .focused($isFirstResponder)
            }
            
            Text(errorMessage)
            
            Button {
                do{
                    let message = try buildMessage()
                    errorMessage = "" // Clear any previous error messages
                    self.shareMessage = shareText(text: message)
                    self.isToShare = true
                } catch {}
            } label: {
                Label("Enviar", systemImage: "square.and.arrow.up.circle")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(Color("serlima"))
                
            }

        }
        .onTapGesture {
            isFirstResponder = false
        }
        .padding()
        .sheet(isPresented: Binding<Bool>(
            get: { self.isToShare },
            set: { newValue in
                self.isToShare = newValue
                // Reset the flag when the sheet is dismissed
                if !newValue {
                    self.isToShare = false
                }
            })
        ) {
            ActivityView(text: shareMessage!.text)
        }
        
    }
    
    private func buildMessage() throws -> String{
        var tempStr = "Olá Sérgio,\n"
        
        if mondayRest{
            tempStr += "Segunda-Feira: Descanso.\n"
        } else{
            tempStr += "Segunda-Feira: \(mondayTrain.title).\n"
        }
        
        for day in weekDays{
            let hasactivities = checkIfHasActivityTypes(activities: day.activities)
            if((day.timeAvailable < 1 && hasactivities) || (day.timeAvailable > 0 && !hasactivities)){
                errorMessage = "Verifica os valores de \(day.dayName)"
                throw ValueError.wrongValues
            }
            
            if (!hasactivities){
                tempStr += "\(day.dayName): Sem possibilidade de treinar.\n"
                continue
            }
            
            tempStr += "\(day.dayName): \(day.timeAvailable) minutos de \(getActivitiesStr(activities: day.activities)).\n"
        }
        
        errorMessage = ""
        
        return tempStr
    }
    
    private func haveAllData(){
        
    }
}

struct AvailabilityView_Previews: PreviewProvider {
    static var previews: some View {
        AvailabilityView(mondayTrain: MondayTrainingType.z1)
    }
}

extension AvailabilityView{
    struct shareText: Identifiable{
        var id: UUID
        var text: String
        
        init(id: UUID = UUID(), text: String) {
            self.id = id
            self.text = text
        }
    }
}

struct ActivityView: UIViewControllerRepresentable {
    let text: String

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityView>) -> UIActivityViewController {
        return UIActivityViewController(activityItems: [text], applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityView>) {}
}
