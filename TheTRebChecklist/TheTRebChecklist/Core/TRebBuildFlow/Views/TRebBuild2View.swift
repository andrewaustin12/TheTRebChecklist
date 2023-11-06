//
//  TRebBuild2View.swift
//  TheTRebChecklist
//
//  Created by andrew austin on 11/5/23.
//

import SwiftUI

struct TRebBuild2View: View {
    @ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Canister")
                ProgressBarView(progress: Double((350/7) * 1))
                    .padding(.leading)
                Form {
                    Section {
                        // Step 4
                        Toggle("Fill Canister and check/verify sufficient remaining scrubber life", isOn: $appViewModel.trebBuild2ViewModel.isScrubberFilledChecked)
                        HStack {
                            Section(header: Text("Time Remaining")) {
                                TextField("Min", text: $appViewModel.trebBuild2ViewModel.scrubberLife)
                                    .keyboardType(.decimalPad)
                                    .padding(8) // Add padding for some spacing
                                    .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                            }
                        }
                        
                        
                        
                    } header: {
                        Text("Step 4")
                    }
                    
                    Section {
                        // Step 5
                        Toggle("Lubricate O-rings if necessary", isOn: $appViewModel.trebBuild2ViewModel.isOringsLubricatedChecked)
                        
                        // Step 6
                        Toggle("Install the Head and screw it tight", isOn: $appViewModel.trebBuild2ViewModel.isHeadScrewedTightChecked)
                        
                        
                    } header: {
                        Text("Steps 5-6")
                    }
                    
                    Section {
                        // Step 7
                        Toggle("Check/verify sufficient remining battery life", isOn: $appViewModel.trebBuild2ViewModel.isBatteryLifeChecked)
                        
                        HStack {
                            Section(header: Text("Volts")) {
                                TextField("V", text: $appViewModel.trebBuild2ViewModel.voltLife)
                                    .keyboardType(.decimalPad)
                                    .padding(8) // Add padding for some spacing
                                    .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                            }
                            Section(header: Text("Percent")) {
                                TextField("%", text: $appViewModel.trebBuild2ViewModel.batterPercentLife)
                                    .keyboardType(.decimalPad)
                                    .padding(8) // Add padding for some spacing
                                    .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                            }
                        }
                        
                    } header: {
                        Text("Step 7")
                    }
                    
                }
                NavigationLink("Next") {
                    TRebBuild3View(appViewModel: appViewModel)
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
}

#Preview {
    TRebBuild2View(appViewModel: AppViewModel())
}
