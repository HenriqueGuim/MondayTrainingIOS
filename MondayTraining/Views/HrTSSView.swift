//
//  HrTSSView.swift
//  MondayTraining
//
//  Created by Henrique Guimarães on 01/02/2024.
//

import SwiftUI

struct HrTSSView: View {
    @State var hrTss = 0
    @State var time = 0
    @State var mondayTraining = MondayTrainingType.z1
    @State var mondayTrainingText = ""
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
                Text("Valor HrTSS")
                    .foregroundColor(Color("serlima"))
                TextField("hr tss", value: $hrTss, formatter: Formatter.lucNumberFormat)
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
                            mondayTraining = try TrainCalculator.tssTrain(time: time, tss: hrTss)
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
                        mondayTraining = try TrainCalculator.tssTrain(time: time, tss: hrTss)
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

struct HrTSSView_Previews: PreviewProvider {
    static var previews: some View {
        HrTSSView()
    }
}
