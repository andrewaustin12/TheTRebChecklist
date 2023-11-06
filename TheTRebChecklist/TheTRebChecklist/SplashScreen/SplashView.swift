//
//  SplashView.swift
//  TheTRebChecklist
//
//  Created by andrew austin on 11/4/23.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Image("treb-app-icon")
                .resizable()
                .frame(width: 400,height: 400)
        }
    }
}

#Preview {
    SplashView()
}
