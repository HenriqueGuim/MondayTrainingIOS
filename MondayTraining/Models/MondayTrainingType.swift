//
//  MondayTrainingType.swift
//  MondayTraining
//
//  Created by Henrique Guimarães on 06/02/2024.
//

import Foundation

enum MondayTrainingType {
    case z3
    case z2
    case z1
    
    var name: String{
        switch self{
        case .z3: return "Bloco Z3"
        case .z2: return "Bloco Z2 ou Descanso"
        case .z1: return "Recuperação ativa"
        }
    }
    
    var title: String{
        switch self{
        case .z3: return "Bloco Z3"
        case .z2: return "Bloco Z2"
        case .z1: return "Recuperação ativa"
        }
    }
}
