//
//  TRebBuild8View.swift
//  TheTRebChecklist
//
//  Created by andrew austin on 11/7/23.
//

import SwiftUI

struct TRebBuild8View: View {
    @ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Dive Log")
                ProgressBarView(progress: Double((350/8) * 7))
                    .padding(.leading)

                
                VStack {
                    HStack {
                        Label("Dive Time:", systemImage: "clock")
                        Spacer()
                        TextField("Min", text: $appViewModel.trebBuild8ViewModel.diveTime)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    }
                    
                    HStack {
                        Label("CCR Total Time:", systemImage: "gauge.with.needle")
                        Spacer()
                        TextField("Min", text: $appViewModel.trebBuild8ViewModel.ccrTotalTime)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    }
                    
                    HStack {
                        Label("Max Depth:", systemImage: "water.waves.and.arrow.down")
    
                        Spacer()
                        TextField("M/Ft", text: $appViewModel.trebBuild8ViewModel.maxDepth)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    }
                    
                    HStack {
                        Label("Scrubber Used:", systemImage: "macpro.gen2")
                        Spacer()
                        TextField("Min", text: $appViewModel.trebBuild8ViewModel.scrubberUsed)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    }
                    
                    HStack {
                        Label("Po2 this Dive:", systemImage: "percent")
                        Spacer()
                        TextField("PP02", text: $appViewModel.trebBuild8ViewModel.ppo2ThisDive)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    }
                    
                    HStack {
                        Label("Avail for next dive", systemImage: "arrow.right.circle")
                        Spacer()
                        TextField("Min", text: $appViewModel.trebBuild8ViewModel.availNextDive)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    }
                }
                .padding()
            }
            Spacer()
            NavigationLink("Next") {
                TRebBuildSummaryView(appViewModel: appViewModel)
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
    TRebBuild8View(appViewModel: AppViewModel())
}
