
import SwiftUI

struct NotificationsView: View {
    private let notificationsService: NotificationsRequestProtocol = NotificationsService()
    
    @State private var isMenuViewPresented = false
    
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
                    notificationsService.requestNotificationsAccess {
                        isMenuViewPresented.toggle()
                    }
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
                    isMenuViewPresented.toggle()
                } label: {
                    Text(Constants.notificationsSkipButton)
                        .font(.inter(size: 46/Double.delim, weight: .medium))
                        .foregroundColor(.grayForeground)
                }
                .padding(.top)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .navigate(to: MenuView(),
                  when: $isMenuViewPresented)
    }
}

#Preview {
    NotificationsView()
}
