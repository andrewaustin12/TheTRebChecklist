//
//  TRebBuild3View.swift
//  TheTRebChecklist
//
//  Created by andrew austin on 11/5/23.
//

import SwiftUI

struct TRebBuild3View: View {
    @ObservedObject var appViewModel: AppViewModel
    
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case s1ReadingAir, s2ReadingAir, s3ReadingAir, s1ReadingHighO2, s2ReadingHighO2, s3ReadingHighO2
    }
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Calibration")
                ProgressBarView(progress: Double((350/8) * 2))
                    .padding(.leading)
                Form {
                    Section {
                        // Step 8
                        Toggle("MV (Ambient Air)", isOn: $appViewModel.trebBuild3ViewModel.isMVAmbientAirChecked)
                        HStack {
                            Section(header: Text("S1")) {
                                TextField("mV", text: $appViewModel.trebBuild3ViewModel.s1ReadingAir)
                                    .focused($focusedTextField, equals: .s1ReadingAir)
                                    .onSubmit {focusedTextField = .s2ReadingAir}
                                    .submitLabel(.next)
                                    .keyboardType(.decimalPad)
                                    .padding(8) // Add padding for some spacing
                                    .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                            }
                            Section(header: Text("S2")) {
                                TextField("mV", text: $appViewModel.trebBuild3ViewModel.s2ReadingAir)
                                    .focused($focusedTextField, equals: .s2ReadingAir)
                                    .onSubmit {focusedTextField = .s3ReadingAir}
                                    .submitLabel(.next)
                                    .keyboardType(.decimalPad)
                                    .padding(8) // Add padding for some spacing
                                    .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                            }
                            Section(header: Text("S3")) {
                                TextField("mV", text: $appViewModel.trebBuild3ViewModel.s3ReadingAir)
                                    .focused($focusedTextField, equals: .s3ReadingAir)
                                    .onSubmit {focusedTextField = nil}
                                    .submitLabel(.done)
                                    .keyboardType(.decimalPad)
                                    .padding(8) // Add padding for some spacing
                                    .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                            }
                        }
                        
                    }header: {
                        Text("Steps 8")
                    }
                    
                    Section {
                        // Step 9
                        Toggle("Calibrate the unit with 100% Oxygen", isOn: $appViewModel.trebBuild3ViewModel.isCalibratedWith02Checked)
                        
                    } header: {
                        Text("Step 9")
                    }
                    
                    Section {
                        // Step 10
                        Toggle("MV (High Oxygen)", isOn: $appViewModel.trebBuild3ViewModel.isMVHighOxygenChecked)
                        
                        HStack {
                            Section(header: Text("S1")) {
                                TextField("mV", text: $appViewModel.trebBuild3ViewModel.s1ReadingHighO2)
                                    .focused($focusedTextField, equals: .s1ReadingHighO2)
                                    .onSubmit {focusedTextField = .s2ReadingHighO2}
                                    .submitLabel(.next)
                                    .keyboardType(.decimalPad)
                                    .padding(8) // Add padding for some spacing
                                    .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                            }
                            Section(header: Text("S2")) {
                                TextField("mV", text: $appViewModel.trebBuild3ViewModel.s2ReadingHighO2)
                                    .focused($focusedTextField, equals: .s2ReadingHighO2)
                                    .onSubmit {focusedTextField = .s3ReadingHighO2}
                                    .submitLabel(.next)
                                    .keyboardType(.decimalPad)
                                    .padding(8) // Add padding for some spacing
                                    .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                            }
                            Section(header: Text("S3")) {
                                TextField("mV", text: $appViewModel.trebBuild3ViewModel.s3ReadingHighO2)
                                    .focused($focusedTextField, equals: .s3ReadingHighO2)
                                    .onSubmit {focusedTextField = nil}
                                    .submitLabel(.done)
                                    .keyboardType(.decimalPad)
                                    .padding(8) // Add padding for some spacing
                                    .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                            }
                        }
                        
                    } header: {
                        Text("Step 10")
                    }
                }
                
            }
            NavigationLink("Next") {
                TRebBuild4View(appViewModel: appViewModel)
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
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Dismiss") { focusedTextField = nil }
                }
            }
        }
    }
}


#Preview {
    TRebBuild3View(appViewModel: AppViewModel())
}
