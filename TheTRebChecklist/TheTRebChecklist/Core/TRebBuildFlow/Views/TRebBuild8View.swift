//
//  TRebBuild8View.swift
//  TheTRebChecklist
//
//  Created by andrew austin on 11/7/23.
//

import SwiftUI

struct TRebBuild8View: View {
    @ObservedObject var appViewModel: AppViewModel
    
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case diveTime, ccrTotalTime, maxDepth, scrubberUsed, ppo2ThisDive, availNextDive
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Dive Log")
                ProgressBarView(progress: Double((350/8) * 7))
                    .padding(.leading)

                
                VStack {
                    HStack{
                        Text("Steps 29-34")
                            .foregroundStyle(.unitPrimaryBackground)
                        Spacer()
                    }
                    HStack {
                        Label("Dive Time:", systemImage: "clock")
                        Spacer()
                        TextField("Min", text: $appViewModel.trebBuild8ViewModel.diveTime)
                            .focused($focusedTextField, equals: .diveTime)
                            .onSubmit {focusedTextField = .ccrTotalTime}
                            .submitLabel(.next)
                            .keyboardType(.numbersAndPunctuation)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    }
                    
                    HStack {
                        Label("CCR Total Time:", systemImage: "gauge.with.needle")
                        Spacer()
                        TextField("Min", text: $appViewModel.trebBuild8ViewModel.ccrTotalTime)
                            .focused($focusedTextField, equals: .ccrTotalTime)
                            .onSubmit {focusedTextField = .maxDepth}
                            .submitLabel(.next)
                            .keyboardType(.numbersAndPunctuation)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    }
                    
                    HStack {
                        Label("Max Depth:", systemImage: "water.waves.and.arrow.down")
    
                        Spacer()
                        TextField("M", text: $appViewModel.trebBuild8ViewModel.maxDepth)
                            .focused($focusedTextField, equals: .maxDepth)
                            .onSubmit {focusedTextField = .scrubberUsed}
                            .submitLabel(.next)
                            .keyboardType(.numbersAndPunctuation)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    }
                    
                    HStack {
                        Label("Scrubber Used:", systemImage: "macpro.gen2")
                        Spacer()
                        TextField("Min", text: $appViewModel.trebBuild8ViewModel.scrubberUsed)
                            .focused($focusedTextField, equals: .scrubberUsed)
                            .onSubmit {focusedTextField = .ppo2ThisDive}
                            .submitLabel(.next)
                            .keyboardType(.numbersAndPunctuation)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    }
                    
                    HStack {
                        Label("Po2 this Dive:", systemImage: "percent")
                        Spacer()
                        TextField("PP02", text: $appViewModel.trebBuild8ViewModel.ppo2ThisDive)
                            .focused($focusedTextField, equals: .ppo2ThisDive)
                            .onSubmit {focusedTextField = .availNextDive}
                            .submitLabel(.next)
                            .keyboardType(.numbersAndPunctuation)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    }
                    
                    HStack {
                        Label("Avail for next dive", systemImage: "arrow.right.circle")
                        Spacer()
                        TextField("Min", text: $appViewModel.trebBuild8ViewModel.availNextDive)
                            .focused($focusedTextField, equals: .availNextDive)
                            .onSubmit {focusedTextField = nil}
                            .submitLabel(.done)
                            .keyboardType(.numbersAndPunctuation)
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
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Dismiss") { focusedTextField = nil }
                }
            }
        }
        
    }
}


#Preview {
    TRebBuild8View(appViewModel: AppViewModel())
}
