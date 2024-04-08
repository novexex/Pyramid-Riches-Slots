
import SwiftUI

struct NotificationsView: View {
    var body: some View {
        ZStack {
            Image(.notificationsBackground)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text(Constants.notificationsTitle)
                    .font(.inter(size: 67/Double.delim, weight: .bold))
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .padding(.vertical)
                
                Text(Constants.notificationsSubtitle)
                    .font(.inter(size: 55/Double.delim, weight: .medium))
                    .foregroundColor(.grayForeground)
                    .padding(.bottom, 20)
                
                Button {
                    
                } label: {
                    Text(Constants.notificationsAcceptButton)
                        .font(.inter(size: 46/Double.delim, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.black)
                }
                .background(.primaryYellow)
                .cornerRadius(22/2.7)
                
                Button {
                    
                } label: {
                    Text(Constants.notificationsSkipButton)
                        .font(.inter(size: 46/Double.delim, weight: .medium))
                        .foregroundColor(.grayForeground)
                }
                .padding(.top)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

#Preview {
    NotificationsView()
}
