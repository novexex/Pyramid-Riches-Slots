
import SwiftUI

struct InfoView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Image(.gameBackground)
                .resizable()
                .ignoresSafeArea()
            
            BackButton(dismiss: dismiss)
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity,
                       alignment: .topLeading)
                .padding(.top)
        }
    }
}

#Preview {
    InfoView()
}
