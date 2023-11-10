//
//  DiveLogCard.swift
//  TheTRebChecklist
//
//  Created by andrew austin on 11/8/23.
//

import SwiftUI

struct DiveLogCard: View {
    let diveTime: String
    let ccrTotalTime: String
    let maxDepth: String
    let scrubberUsed: String
    let ppo2ThisDive: String
    let availNextDive: String
    
    var body: some View {
        VStack {
            Text("Dive Log")
                .font(.title)
                .padding(.bottom, 1)
                .padding(.top, 0)
            HStack {
                Text("Dive Time:")
                Spacer()
                Text("\(diveTime) Min" )
            }
            
            HStack {
                Text("CCR Total Time:")
                Spacer()
                Text("\(ccrTotalTime) Min")
            }
            
            HStack {
                Text("Max Depth:")

                Spacer()
                Text("\(maxDepth) Meters")
            }
            
            HStack {
                Text("Scrubber Used:")
                Spacer()
                Text("\(scrubberUsed) Min")
            }
            
            HStack {
                Text("Po2 this Dive:")
                Spacer()
                Text("\(ppo2ThisDive)%")
            }
            
            HStack {
                Text("Avail for next dive")
                Spacer()
                Text("\(availNextDive)%")
            }
        }
        .padding()
    }
}

#Preview {
    DiveLogCard(diveTime: "62", ccrTotalTime: "200", maxDepth: "40", scrubberUsed: "200", ppo2ThisDive: "1.2", availNextDive: "1.2")
}
