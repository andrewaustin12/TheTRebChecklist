//
//  SummaryMixGasCard.swift
//  TheTRebChecklist
//
//  Created by andrew austin on 11/10/23.
//

import SwiftUI

struct SummaryMixedGasCard: View {
    
    var title: String
    var dil2: String
    var dil3: String
    var dil4: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
            HStack{
                Spacer()
                VStack{
                    Text("Dil 2:")
                        .font(.headline)
                    Text("\(dil2) ")
                        
                }
                Spacer()
                VStack{
                    Text("Dil 3:")
                        .font(.headline)
                    Text("\(dil3) ")
                        
                }
                Spacer()
                VStack{
                    Text("Dil 4:")
                        .font(.headline)
                    Text("\(dil4) ")
                        
                }
                Spacer()
                
            }
        }
        .padding()
    }
}

#Preview {
    SummaryMixedGasCard(title: "Mix Gas Content", dil2: "21", dil3: "16/80", dil4: "21")
}
