//
//  TRebBuild6View.swift
//  TheTRebChecklist
//
//  Created by andrew austin on 11/5/23.
//

import SwiftUI

struct TRebBuild6View: View {
    @Environment(\.presentationMode) var presentationMode
    @State var showSheet: Bool = false
    
    @ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Prebreathe Checks")
                ProgressBarView(progress: Double((350/8) * 5))
                    .padding(.leading)
                List {
                    Section {
                        // Step 19
                        Toggle("Breathe from / check function of Diluent open circuit bail out regulator", isOn: $appViewModel.trebBuild6ViewModel.isDiluentBailoutOCRegChecked)
                        // Step 20
                        Toggle("Connect Diluent supply hose to unit and open valve", isOn: $appViewModel.trebBuild6ViewModel.isDiluentHoseConnectedChecked)
                        // Step 21
                        Toggle("Switch controler on", isOn: $appViewModel.trebBuild6ViewModel.isControlerOnChecked)
                        // Step 22
                        Toggle("Connect Oxygen supply hose to unit and open valve", isOn: $appViewModel.trebBuild6ViewModel.isOxygenHoseConnectedChecked)
                        
                        
                    } header: {
                        Text("Steps 19-22")
                    }
                    
                    Section {
                        // Step 23
                        Toggle("Perform a 2 minute PRE-BREATHE check", isOn: $appViewModel.trebBuild6ViewModel.isPreBreatheDoneChecked)
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
                        Text("Step 23")
                    }
        
                }
            }
            NavigationLink("Next") {
                TRebBuild7View(appViewModel: appViewModel)
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
    TRebBuild6View(appViewModel: AppViewModel())
}
