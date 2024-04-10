//
//  TSSView.swift
//  MondayTraining
//
//  Created by Henrique Guimarães on 01/02/2024.
//

import SwiftUI

struct TSSView: View {
    @State var tss = 0
    @State var time = 0
    @State var mondayTrainingText = ""
    @State var mondayTraining = MondayTrainingType.z1
    @State private var isValuesReady = true
    
    var body: some View {
        NavigationStack{
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
                .padding()
                
                VStack {
                    Text("Valor TSS")
                        .foregroundColor(Color("serlima"))
                    TextField("tss", value: $tss, formatter: Formatter.lucNumberFormat)
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                }
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
                                mondayTraining = try TrainCalculator.tssTrain(time: time, tss: tss)
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
                            mondayTraining = try TrainCalculator.tssTrain(time: time, tss: tss)
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
            
        }
        .font(Font.custom("edmondsans_regular", size: 25))
    }
}

extension Formatter {
    static let lucNumberFormat: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.minusSign   = "👺 "  // Just for fun!
        formatter.zeroSymbol  = ""     // Show empty string instead of zero
        return formatter
    }()
}

struct TSSView_Previews: PreviewProvider {
    static var previews: some View {
        TSSView()
    }
}
