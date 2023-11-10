//
//  TRebBuild7View.swift
//  TheTRebChecklist
//
//  Created by andrew austin on 11/5/23.
//

import SwiftUI

struct TRebBuild7View: View {
    
    @ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Operational Checks")
                ProgressBarView(progress: Double((350/8) * 6))
                    .padding(.leading)
                List {
                    Section {
                        // Step 24
                        Toggle("Check operation of manual addition valve \n(oxygen and diluent)", isOn: $appViewModel.trebBuild7ViewModel.isMAVo2DilChecked)
                        // Step 25
                        Toggle("Check operation of ACS while breathing from unit", isOn: $appViewModel.trebBuild7ViewModel.isAcsOperationalChecked)
                        // Step 26
                        Toggle("Check if the Solenoid is working", isOn: $appViewModel.trebBuild7ViewModel.isSolenoidWorkingChecked)
                        // Step 27
                        Toggle("Turn off controller for transportation and close all valves", isOn: $appViewModel.trebBuild7ViewModel.isControllerOffChecked)
                        // Step 28
                        Toggle("Check middle pressure of oxygen First Stage", isOn: $appViewModel.trebBuild7ViewModel.isOxygenMiddlePressureChecked)
                        Text("Note: \nShould be 5 bar")
                            .foregroundStyle(.unitPrimaryForeground)
                        
                    } header: {
                        Text("Steps 24-28")
                    }
        
                }
            }
            NavigationLink("Finish") {
                TRebBuild8View(appViewModel: appViewModel)
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
    TRebBuild7View(appViewModel: AppViewModel())
}
