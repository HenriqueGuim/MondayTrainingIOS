//
//  PSEView.swift
//  MondayTraining
//
//  Created by Henrique Guimarães on 01/02/2024.
//

import SwiftUI

struct PSEView: View {
    @State var pse = 0
    @State var time = 0
    @State var mondayTrainingText = ""
    @State var mondayTraining = MondayTrainingType.z1
    @FocusState private var isFirstResponder :Bool

    var body: some View {
        VStack{
            VStack {
                Text("Tempo")
                    .foregroundColor(Color("serlima"))
                TextField("Em Minutos", value: $time, formatter: Formatter.lucNumberFormat)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                Text("\(convertMinutesToTime(time: time))")
            }
            .focused($isFirstResponder)
            .padding()
            
            VStack {
                Text("Valor PSE")
                    .foregroundColor(Color("serlima"))
                TextField("1-10", value: $pse, formatter: Formatter.lucNumberFormat)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
            }
            .focused($isFirstResponder)
            .padding()
            
            HStack{
                if (mondayTrainingText != "" && mondayTrainingText != "Verifica os valores"){
                    NavigationLink(destination: AvailabilityView(mondayTrain: mondayTraining)){
                        Label("Disponibilidade", systemImage: "timer")
                            .foregroundColor(Color("serlima"))
                    }
                    
                } else {
                    Button(action:{
                        
                        do{
                            mondayTraining = try TrainCalculator.pseTrain(time: time, pse: pse)
                            mondayTrainingText = mondayTraining.name
                        } catch {
                            mondayTrainingText = "Verifica os valores"
                        }
                    }
                    ){
                        Label("Disponibilidade", systemImage: "timer")
                            .foregroundColor(Color("serlima"))
                    }
                }
                
                Button(action:{
                    do{
                        mondayTraining = try TrainCalculator.pseTrain(time: time, pse: pse)
                        mondayTrainingText = mondayTraining.name
                    } catch {
                        mondayTrainingText = "Verifica os valores"
                    }
                }
                ){
                    Label("Calcular", systemImage: "plus.forwardslash.minus")
                        .foregroundColor(Color("serlima"))
                }
                
                
            }
            
            .padding()
            
            Text(mondayTrainingText)
            
            Spacer()
        }
        .onTapGesture {
            isFirstResponder = false
        }
        .font(Font.custom("edmondsans_regular", size: 25))
    }
}

struct PSEView_Previews: PreviewProvider {
    static var previews: some View {
        PSEView()
    }
}
