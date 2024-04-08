
import SwiftUI

struct InfoButton: View {
    let action: () -> ()
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Image(.btnBack)
                Image(systemName: "info")
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    InfoButton {}
}
