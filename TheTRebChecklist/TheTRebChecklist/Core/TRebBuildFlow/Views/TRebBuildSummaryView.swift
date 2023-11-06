//
//  TRebBuildSummaryView.swift
//  TheTRebChecklist
//
//  Created by andrew austin on 11/5/23.
//

import SwiftUI

struct TRebBuildSummaryView: View {
    var body: some View {
        NavigationStack {
            VStack{
                
                if TRebBuildViewModel.areAllStepsCompleted {
                    SummaryCard(isComplete: true, step: "All Steps Complete!")
                        .padding(.top)
                        .padding(.bottom)
                        
                        
                        Image("celebration")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400, height: 400)
                            .font(.system(size: 200))
                
                } else {
                    Text("Some steps are not completed:")
                        .font(.title)
                        .bold()

                    ScrollView {
                        Section {
                            ForEach(TRebBuildViewModel.incompleteSteps, id: \.self) { step in
                                SummaryCard(isComplete: false, step: "Step \(step)")
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    TRebBuildSummaryView()
}
