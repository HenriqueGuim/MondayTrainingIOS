//
//  ContentView.swift
//  MondayTraining
//
//  Created by Henrique Guimarães on 31/01/2024.
//

import SwiftUI

struct MenuView: View {
    @State var isSplashPresented = false
    var body: some View {
        if !isSplashPresented {
                        // Splash screen view
                        SplashView()
                            .onAppear {
                                // Simulate a delay for the splash screen
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    withAnimation {
                                        self.isSplashPresented = true
                                    }
                                }
                            }
        } else {
            NavigationStack{
                MenuButtonView(title: "TSS", redirectView: AnyView(TSSView()))
                
                MenuButtonView(title: "HR TSS", redirectView: AnyView(HrTSSView()))
                
                MenuButtonView(title: "PSE", redirectView: AnyView(TSSView()))
            }
            .accentColor(Color("serlima"))
        }

    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

