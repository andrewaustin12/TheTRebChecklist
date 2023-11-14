//
//  TRebStartView.swift
//  TheTRebChecklist
//
//  Created by andrew austin on 11/5/23.
//

import SwiftUI

struct TRebStartView: View {
    @StateObject var appViewModel = AppViewModel()
    
    var body: some View {
        NavigationStack {
            Spacer()
            VStack {
                
                Image("treb-app-icon")
                    .resizable()
                    .frame(width: .infinity)
                    .frame(height: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    .font(.system(size: 200))
            }
            .padding()
                
            NavigationLink {
                TRebBuild1View(appViewModel: appViewModel)
            } label: {
                Text("Begin")
            }
            .modifier(PrimaryButtonModifier())
            .foregroundColor(.white)
            Spacer()
        }
    }
}

#Preview {
    TRebStartView()
}
