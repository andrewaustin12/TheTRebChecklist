//
//  TRebBuild4View.swift
//  TheTRebChecklist
//
//  Created by andrew austin on 11/5/23.
//

import SwiftUI

struct TRebBuild4View: View {
    @ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Assembly")
                ProgressBarView(progress: Double((350/8) * 3))
                    .padding(.leading)
                Form {
                    Section {
                        // Step 11
                        Toggle("Inspect for damage or wear:", isOn: $appViewModel.trebBuild4ViewModel.isInspectedForDamageWearChecked)
                        VStack(alignment: .leading) {
                            Text("- Harness")
                            Text("- Sidemount")
                            Text("- Counterlung")
                            Text("- Breathing Hoses")
                        }
                        
                    } header: {
                        Text("Steps 11")
                    }
                    Section {
                        // Step 12
                        Toggle("OPRV Valve should be close from the counterlung before assembling ", isOn: $appViewModel.trebBuild4ViewModel.isOPRVClosedChecked)
                        
                        // Step 13
                        Toggle("Assemble unit (without loop) be sure the canister is closed (bayonet system)", isOn: $appViewModel.trebBuild4ViewModel.isUnitAssembledCanClosedChecked)
                        
                        // Step 14
                        Toggle("Check correct functioning of one way valves in mouth piece", isOn: $appViewModel.trebBuild4ViewModel.isMouthPieceValvesChecked)
                        
                        // Step 15
                        Toggle("Assemble loop to the unit", isOn: $appViewModel.trebBuild4ViewModel.isLoopAssembledToUnitChecked)
                        Text("Note: \nPosition loop for diving in correct way")
                            .font(.footnote)
                            .bold()
                            .foregroundStyle(.unitPrimaryForeground)
                        
                    } header: {
                        Text("Steps 11-15")
                    }
        
                }
            }
            NavigationLink("Next") {
                TRebBuild5View(appViewModel: appViewModel)
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
    TRebBuild4View(appViewModel: AppViewModel())
}
