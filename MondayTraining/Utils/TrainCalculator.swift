//
//  TrainCalculator.swift
//  MondayTraining
//
//  Created by Henrique Guimarães on 06/02/2024.
//

import Foundation
struct TrainCalculator {
    static func tssTrain(time: Int, tss: Int) throws -> MondayTrainingType{
        
        if(time <= 0 || tss <= 0){
            throw ValueError.missingParameter
        }
        
        let value = (Double(tss)/Double(time))*iF(time: time)
        
        var train = MondayTrainingType.z2
        
        if(value < 0.85){
            train = MondayTrainingType.z3
        }
        
        if(value > 1.1){
            train = MondayTrainingType.z1
        }
        
        return train
        
    }
    
    static private func iF(time: Int) -> Double{
        if(time >= 720){
            return 1.55;
        }
        if(time >= 660){
            return 1.5;
        }
        if(time >= 600){
            return 1.45;
        }
        if(time >= 540){
            return 1.4;
        }
        if(time >= 480){
            return 1.35;
        }
        if(time >= 420){
            return 1.3;
        }
        if(time >= 360){
            return 1.25;
        }
        if(time >= 300){
            return 1.2;
        }
        if(time >= 240){
            return 1.15;
        }
        if(time >= 180){
            return 1.1;
        }
        if(time >= 120){
            return 1.05;
        }
        if(time >= 60){
            return 1.0;
        }
        
        return 0.9;
    }
    
    static func pseTrain(time: Int, pse: Int) throws -> MondayTrainingType{
        var tss: Int
        
        switch pse {
        case 1: tss = 20*time/60
        case 2: tss = 30*time/60
        case 3: tss = 40*time/60
        case 4: tss = 50*time/60
        case 5: tss = 60*time/60
        case 6: tss = 70*time/60
        case 7: tss = 80*time/60
        case 8: tss = 100*time/60
        case 9: tss = 120*time/60
        case 10: tss = 140*time/60
        default:
            throw ValueError.wrongPseValue
            
        }
        
        return try tssTrain(time: time, tss: tss)
    }
}
