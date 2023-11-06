//
//  TRebBuild3View.swift
//  TheTRebChecklist
//
//  Created by andrew austin on 11/5/23.
//

import SwiftUI

struct TRebBuild3View: View {
    @State private var isMVAmbientAirChecked = false
    @State private var s1ReadingAir = ""
    @State private var s2ReadingAir = ""
    @State private var s3ReadingAir = ""
    @State private var isCalibratedWith02Checked = false
    @State private var isMVHighOxygenChecked = false
    @State private var s1ReadingHighO2 = ""
    @State private var s2ReadingHighO2 = ""
    @State private var s3ReadingHighO2 = ""
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Calibration")
                ProgressBarView(progress: Double((350/7) * 2))
                    .padding(.leading)
                Form {
                    Section {
                        // Step 8
                        Toggle("MV (Ambient Air)", isOn: $isMVAmbientAirChecked)
                        HStack {
                            Section(header: Text("S1")) {
                                TextField("%", text: $s1ReadingAir)
                                    .keyboardType(.decimalPad)
                                    .padding(8) // Add padding for some spacing
                                    .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                            }
                            Section(header: Text("S2")) {
                                TextField("%", text: $s2ReadingAir)
                                    .keyboardType(.decimalPad)
                                    .padding(8) // Add padding for some spacing
                                    .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                            }
                            Section(header: Text("S3")) {
                                TextField("%", text: $s3ReadingAir)
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
                        Toggle("Calibrate the unit with 100% Oxygen", isOn: $isCalibratedWith02Checked)
                        
                    } header: {
                        Text("Step 9")
                    }
                    
                    Section {
                        // Step 10
                        Toggle("MV (High Oxygen)", isOn: $isMVHighOxygenChecked)
                        
                        HStack {
                            Section(header: Text("S1")) {
                                TextField("%", text: $s1ReadingHighO2)
                                    .keyboardType(.decimalPad)
                                    .padding(8) // Add padding for some spacing
                                    .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                            }
                            Section(header: Text("S2")) {
                                TextField("%", text: $s2ReadingHighO2)
                                    .keyboardType(.decimalPad)
                                    .padding(8) // Add padding for some spacing
                                    .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                            }
                            Section(header: Text("S3")) {
                                TextField("%", text: $s3ReadingHighO2)
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
                TRebBuild4View()
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
    TRebBuild3View()
}
