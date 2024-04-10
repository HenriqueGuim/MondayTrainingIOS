//
//  SplashView.swift
//  MondayTraining
//
//  Created by Henrique Guimarães on 09/02/2024.
//

import SwiftUI

struct SplashView: View {
    
    var body: some View {
        VStack{
            Text("ACOMPANHAMENTO\nPROFISSIONAL")
                .multilineTextAlignment(.center)
                .foregroundColor(Color("serlima"))
                .font(.custom("edmondsans_regular", size: 38))
                
            
            Image("logo_serlima")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: .infinity)
            VStack{
                Text("Created by:\nHenrique Guimarães")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .font(.custom("edmondsans_regular", size: 20))
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
