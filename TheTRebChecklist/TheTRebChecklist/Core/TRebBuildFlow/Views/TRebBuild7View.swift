//
//  TRebBuild7View.swift
//  TheTRebChecklist
//
//  Created by andrew austin on 11/5/23.
//

import SwiftUI

struct TRebBuild7View: View {
    
    @State private var isMAVo2DilChecked = false
    @State private var isAcsOperationalChecked = false
    @State private var isSolenoidWorkingChecked = false
    @State private var isControllerOffChecked = false
    @State private var isOxygenMiddlePressureChecked = false
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Operational Checks")
                ProgressBarView(progress: Double((350/7) * 6))
                    .padding(.leading)
                List {
                    Section {
                        // Step 24
                        Toggle("Check operation of manual addition valve \n(oxygen and diluent)", isOn: $isMAVo2DilChecked)
                        // Step 25
                        Toggle("Check operation of ACS while breathing from unit", isOn: $isAcsOperationalChecked)
                        // Step 26
                        Toggle("Check if the Solenoid is working", isOn: $isSolenoidWorkingChecked)
                        // Step 27
                        Toggle("Turn off controller for transportation and close all valves", isOn: $isControllerOffChecked)
                        // Step 28
                        Toggle("Check middle pressure of oxygen First Stage", isOn: $isOxygenMiddlePressureChecked)
                        Text("Note: \nShould be 5 bar")
                            .foregroundStyle(.unitPrimaryForeground)
                        
                    } header: {
                        Text("Steps 24-28")
                    }
        
                }
            }
            NavigationLink("Finish") {
                TRebBuildSummaryView()
            }
            .modifier(PrimaryButtonModifier())
            .foregroundColor(.white)
            .padding(.top)
            .padding(.bottom)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        MainTabView()
                    } label: {
                        Image(systemName: "house")
                    }
                }
            }
        }
    }
}

#Preview {
    TRebBuild7View()
}
