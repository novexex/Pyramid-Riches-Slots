
import SwiftUI

struct CoinsLabel: View {
    @StateObject private var storage = StorageService.shared
    
    var body: some View {
        HStack {
            Image(.coinIcon)
                .shadow(color: .black,
                        radius: 4, x: -3, y: 3)
            
            Text(storage.coinsAmount.descriptionWithSpaces)
                .font(.muller(size: 70/Double.delim))
                .foregroundStyle(Constants.coinsGradient)
                .lineLimit(1)
                .offset(y: 2)
        }
    }
}

#Preview {
    CoinsLabel()
}
