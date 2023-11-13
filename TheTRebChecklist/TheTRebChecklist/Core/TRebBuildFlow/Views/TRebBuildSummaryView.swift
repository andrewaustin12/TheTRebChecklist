//
//  TRebBuildSummaryView.swift
//  TheTRebChecklist
//
//  Created by andrew austin on 11/5/23.
//

import SwiftUI

struct TRebBuildSummaryView: View {
    @ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack {
            VStack{
                
                if appViewModel.areAllStepsCompleted {
                    SummaryCard(isComplete: true, step: "All Steps Complete!")
                        .padding(.top)
                        .padding(.bottom)
                    
                    ScrollView {
                        Text("Summary of Build")
                            .font(.largeTitle)
                        
                        
                        VStack(alignment: .leading) {
                            Text("You have \(appViewModel.trebBuild2ViewModel.scrubberLife) min left on your scrubber.")
                            Text("You have \(appViewModel.trebBuild1ViewModel.oxygenPressure) Bar of O2  and \(appViewModel.trebBuild1ViewModel.diluent1Pressure) Bar of Dil for the dive.")
                        }
                        
                        SummaryGasCard(title: "Gas Content",
                                       o2Content: appViewModel.trebBuild1ViewModel.oxygenPercent,
                                       bailoutOneDilContent: appViewModel.trebBuild1ViewModel.diluent1Percent
                                       
                        )
                        
                        if appViewModel.trebBuild1ViewModel.isUsingMixedGasChecked {
                            SummaryMixedGasCard(title: "Mix Gas Content",
                                                dil2: appViewModel.trebBuild1ViewModel.diluent2Mix,
                                                dil3: appViewModel.trebBuild1ViewModel.diluent3Mix,
                                                dil4: appViewModel.trebBuild1ViewModel.diluent4Mix)
                        }
                        
                        SummaryCellAirReading(title: "mV Reading w/ Air",
                                              cell1: appViewModel.trebBuild3ViewModel.s1ReadingAir,
                                              cell2: appViewModel.trebBuild3ViewModel.s2ReadingAir,
                                              cell3: appViewModel.trebBuild3ViewModel.s3ReadingAir
                        )
                        SummaryCellO2Card(title: "mV Reading w/ Oxygen",
                                          cell1: appViewModel.trebBuild3ViewModel.s2ReadingHighO2,
                                          cell2: appViewModel.trebBuild3ViewModel.s2ReadingHighO2,
                                          cell3: appViewModel.trebBuild3ViewModel.s2ReadingHighO2
                        )
                        SummaryVoltageCard(title: "Battery",
                                           voltage: appViewModel.trebBuild2ViewModel.voltLife,
                                           batteryPercent: appViewModel.trebBuild2ViewModel.batterPercentLife
                        )
                        DiveLogCard(
                            diveTime: appViewModel.trebBuild8ViewModel.diveTime,
                            ccrTotalTime: appViewModel.trebBuild8ViewModel.ccrTotalTime,
                            maxDepth: appViewModel.trebBuild8ViewModel.maxDepth,
                            scrubberUsed: appViewModel.trebBuild8ViewModel.scrubberUsed,
                            ppo2ThisDive: appViewModel.trebBuild8ViewModel.ppo2ThisDive,
                            availNextDive: appViewModel.trebBuild8ViewModel.availNextDive)
                        
                        
                    }
                    
                    
                } else {
                    Text("Some steps are not finished:")
                        .font(.title)
                        .bold()
                    
                    ScrollView {
                        Section {
                            ForEach(appViewModel.incompleteSteps, id: \.self) { step in
                                SummaryCard(isComplete: false, step: "Step \(step)")
                            }
                        }
                    }
                }
            }
            .padding()
            
            NavigationLink("Finish") {
                MainTabView()
            }
            .font(.title)
            .bold()
            .modifier(PrimaryButtonModifier())
            .disabled(!appViewModel.areAllStepsCompleted)
            .foregroundColor(appViewModel.areAllStepsCompleted ? .white : .unitPrimaryBackground)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
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
    TRebBuildSummaryView(appViewModel: AppViewModel())
}
