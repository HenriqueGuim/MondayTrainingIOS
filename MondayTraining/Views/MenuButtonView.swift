//
//  MenuButtonView.swift
//  MondayTraining
//
//  Created by Henrique Guimarães on 01/02/2024.
//

import SwiftUI

struct MenuButtonView: View {
    let title: String
    let redirectView: AnyView
    var body: some View {
        NavigationLink(destination: AnyView(redirectView)){
            Text(title)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .padding()
        .tint(Color("serlima"))
    }
}

struct MenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MenuButtonView(title: "TSS", redirectView: AnyView(TSSView()))
            .previewLayout(.sizeThatFits)
    }
}
