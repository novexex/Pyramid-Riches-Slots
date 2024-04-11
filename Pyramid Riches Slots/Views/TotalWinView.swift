
import SwiftUI

struct TotalWinView: View {
    @Binding var isPresented: Bool
    let goToHome: DismissAction
    let win: Int
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.7)
                .ignoresSafeArea()
            
            Button {
                isPresented.toggle()
            } label: {
                Image(.backBtn)
            }
            .frame(maxWidth: .infinity, 
                   maxHeight: .infinity,
                   alignment: .topLeading)
            .padding()
            
            VStack {
                Image(.totalWinTitle)
                
                Image(.winTextField)
                    .overlay {
                        HStack {
                            Text("+\(win.descriptionWithSpaces)")
                                .font(.muller(size: 90/Double.delim, weight: .bold))
                                .foregroundStyle(Constants.coinsGradient)
                                .offset(y: 2)
                            
                            Image(.coinIcon)
                        }
                    }
                
                Button {
                    goToHome()
                } label: {
                    Image(.homeBtn)
                }
                .padding(.top)
            }
        }
    }
}
