//
//  TRebBuild1ViewModel.swift
//  TheTRebChecklist
//
//  Created by andrew austin on 11/5/23.
//

import SwiftUI

struct TRebBuild1View: View {
    @ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Gas Checks")
                ProgressBarView(progress: Double((350/8) * 0.1))
                    .padding(.leading)
                Form {
                    Section {
                        // Step 1
                        Toggle("Fill Oxygen/ Diluent Cylinders", isOn: $appViewModel.trebBuild1ViewModel.is02DilFilledChecked)
                        
                        VStack {
                            Text("Record Pressure:")
                            HStack {
                                Section(header: Text("O2")) {
                                    TextField("Bar", text: $appViewModel.trebBuild1ViewModel.oxygenPressure)
                                        .keyboardType(.decimalPad)
                                        .padding(8) // Add padding for some spacing
                                        .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                                }
                                Section(header: Text("Dil 1")) {
                                    TextField("Bar", text: $appViewModel.trebBuild1ViewModel.diluent1Pressure)
                                        .keyboardType(.decimalPad)
                                        .padding(8) // Add padding for some spacing
                                        .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                                }
                                
                            }
                        }
                        
                        
                        
                    } header: {
                        Text("Steps 1")
                    }
                    
                    Section {
                        // Step 2
                        Toggle("Analyze Oxygen/ Diluent Cylinders", isOn: $appViewModel.trebBuild1ViewModel.is02DilAnalyzedChecked)
                        
                        VStack {
                            Text("Record Mix:")
                            HStack {
                                
                                Section(header: Text("O2")) {
                                    TextField("%", text: $appViewModel.trebBuild1ViewModel.oxygenPercent)
                                        .keyboardType(.decimalPad)
                                        .padding(8) // Add padding for some spacing
                                        .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                                }
                                Section(header: Text("Dil 1")) {
                                    TextField("%", text: $appViewModel.trebBuild1ViewModel.diluent1Percent)
                                        .keyboardType(.decimalPad)
                                        .padding(8) // Add padding for some spacing
                                        .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                                }
                                
                            }
                        }
                        
                        Text("Note:\nMinimum 98% oxygen required")
                            .bold()
                            .foregroundStyle(.unitPrimaryForeground)
                        
                        
                    } header: {
                        Text("Step 2")
                    }
                    
                    Section {
                        // Step 3
                        Toggle("Using Mixed Gas?", isOn: $appViewModel.trebBuild1ViewModel.isUsingMixedGasChecked)
                        if  appViewModel.trebBuild1ViewModel.isUsingMixedGasChecked {
                            VStack {
                                Text("Record Mixes:")
                                HStack {
                                    
                                    Section(header: Text("Dil 2")) {
                                        TextField("mix", text: $appViewModel.trebBuild1ViewModel.diluent2Mix)
                                            .keyboardType(.decimalPad)
                                            .padding(8) // Add padding for some spacing
                                            .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                                    }
                                    Section(header: Text("Dil 3")) {
                                        TextField("mix", text: $appViewModel.trebBuild1ViewModel.diluent3Mix)
                                            .keyboardType(.decimalPad)
                                            .padding(8) // Add padding for some spacing
                                            .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                                    }
                                    Section(header: Text("Dil 4")) {
                                        TextField("mix", text: $appViewModel.trebBuild1ViewModel.diluent4Mix)
                                            .keyboardType(.decimalPad)
                                            .padding(8) // Add padding for some spacing
                                            .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                                    }
                                    
                                }
                            }
                        }
                    } header: {
                        Text("Step 3")
                    }
                }
            }
            NavigationLink("Next") {
                TRebBuild2View(appViewModel: appViewModel)
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
    TRebBuild1View(appViewModel: AppViewModel())
}
