

import SwiftUI

struct SummaryGasCard: View {
    
    var title: String
    var o2Content: String
    var bailoutOneDilContent: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
            HStack{
                Spacer()
                VStack{
                    Text("Oxygen:")
                        .font(.headline)
                    Text("\(o2Content) %")
                        
                }
                Spacer()
                VStack{
                    Text("Diluent:")
                        .font(.headline)
                    Text("\(bailoutOneDilContent) %")
                        
                }
                Spacer()
                
            }
        }
        .padding()
    }
}

#Preview {
    SummaryGasCard(title: "Gas Contents", o2Content: "99", bailoutOneDilContent: "21")
}

