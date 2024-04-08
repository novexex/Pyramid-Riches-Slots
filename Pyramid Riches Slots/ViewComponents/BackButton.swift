
import SwiftUI

struct BackButton: View {
    let dismiss: DismissAction
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(.backBtn)
        }
    }
}
