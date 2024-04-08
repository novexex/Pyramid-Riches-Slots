
import SwiftUI

struct CoinsLabel: View {
    @StateObject private var storage = StorageService()
    
    var body: some View {
        HStack {
            Image(.coinIcon)
            
            Text(storage.coinsAmount.description)
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
