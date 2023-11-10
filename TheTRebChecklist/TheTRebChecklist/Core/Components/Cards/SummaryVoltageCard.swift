//
//  SummaryVoltageCard.swift
//  TheTRebChecklist
//
//  Created by andrew austin on 11/6/23.
//

import SwiftUI

struct SummaryVoltageCard: View {
    
    var title: String
    var voltage: String
    var batteryPercent: String

    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .padding(.bottom, 1)
                .padding(.top, 0)
            HStack {
                Spacer()
                VStack {
                    Text("Voltage")

                    Text("\(voltage)V")
                    
                }
                Spacer()
                VStack {
                    Text("Battery Life")
                    
                    Text("\(batteryPercent)%")
                    
                    
                }
                Spacer()
            }

        }
    }
}
#Preview {
    SummaryVoltageCard(title: "Battery Summary", voltage: "1.45", batteryPercent: "99")
}

