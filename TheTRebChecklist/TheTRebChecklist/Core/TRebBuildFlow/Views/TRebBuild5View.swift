//
//  TRebBuild5View.swift
//  TheTRebChecklist
//
//  Created by andrew austin on 11/5/23.
//

import SwiftUI

struct TRebBuild5View: View {
    @Environment(\.presentationMode) var presentationMode
    @State var showSheet: Bool = false
    
    @ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                TitleHeaderView(title: "POS/NEG Checks")
                ProgressBarView(progress: Double((350/8) * 4))
                    .padding(.leading)
                List {
                    Section {
                        // Step 16
                        Toggle("Perform a 2 minute POSITIVE Pressure loop test", isOn: $appViewModel.trebBuild5ViewModel.isPositivePressureTestChecked)
                        Button {
                            showSheet.toggle()
                        } label: {
                            Text("Timer")
                                .font(.title)
                                .frame(width: 300, height: 44)
                                .background(Color(.unitPrimaryForeground))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .sheet(isPresented: $showSheet) {
                            CountdownTimerView()
                        }
                        
                    } header: {
                        Text("Step 16")
                    }
                    
                    Section {
                        // Step 17
                        Toggle("Check automatic venting of counterlung overpressure relief valve in close [dive] position", isOn: $appViewModel.trebBuild5ViewModel.isCounterlungVentingChecked)
                        
                    } header: {
                        Text("Step 17")
                    }
                    
                    Section {
                        // Step 18
                        Toggle("Perform a 2 minute NEGATIVE Pressure loop test", isOn: $appViewModel.trebBuild5ViewModel.isNegativePressureTestChecked)
                        Button {
                            showSheet.toggle()
                        } label: {
                            Text("Timer")
                                .font(.title)
                                .frame(width: 300, height: 44)
                                .background(Color(.unitPrimaryForeground))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .sheet(isPresented: $showSheet) {
                            CountdownTimerView()
                        }
                        
                    } header: {
                        Text("Step 18")
                    }
        
                }
            }
            NavigationLink("Next") {
                TRebBuild6View(appViewModel: appViewModel)
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
    TRebBuild5View(appViewModel: AppViewModel())
}
