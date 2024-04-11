
import SwiftUI
import PopupView

struct GameView: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var viewModel = ViewModel()
    @StateObject private var storage = StorageService.shared
    
    @State private var isTotalWinViewPresented = false
    
    var body: some View {
        ZStack {
            Image(.gameBackground)
                .resizable()
                .ignoresSafeArea()
            
            gameBoard
            
            VStack {
                topUI
                
                Spacer()
                
                bottomUI
            }
        }
        .popup(isPresented: $isTotalWinViewPresented) {
            TotalWinView(isPresented: $isTotalWinViewPresented,
                         goToHome: dismiss,
                         win: viewModel.winAmount)
        }
        .onAppear {
            viewModel.refillBoard()
            viewModel.winAmount = 40000
        }
        .onChange(of: viewModel.winAmount, perform: { value in
            if value >= 1000 {
                isTotalWinViewPresented.toggle()
            }
        })
    }
    
    var topUI: some View {
        HStack {
            BackButton(dismiss: dismiss)
            
            Spacer()
            
            CoinsLabel()
        }
        .padding()
    }
    
    var bottomUI: some View {
        HStack {
            winLabel
            
            spinButton
            
            betLabel
        }
    }
    
    var winLabel: some View {
        ZStack {
            Image(.winLabel)
                .overlay {
                    VStack {
                        Text("win")
                            .foregroundStyle(.yellow)
                        Text("\(viewModel.winAmount)")
                            .foregroundStyle(.white)
                    }
                    .font(.multiroundPro(size: 44/Double.delim))
                }
        }
    }
    
    var spinButton: some View {
        Button {
            withAnimation {
                viewModel.spin()
            }
        } label: {
            Image(.spinButton)
                .overlay {
                    Text("Spin")
                        .font(.multiroundPro(size: 57/Double.delim))
                        .foregroundStyle(.white)
                }
        }
        .disabled(storage.coinsAmount < viewModel.betAmount || viewModel.betAmount == 0)
    }
    
    var betLabel: some View {
        HStack(spacing: 0) {
            Button {
                viewModel.betAmount -= 10
            } label: {
                Image(.incrButton)
                    .overlay {
                        Text("-")
                            .font(.multiroundPro(size: 57/Double.delim))
                            .foregroundStyle(.white)
                    }
            }
            .disabled(viewModel.betAmount == 0)
            
            Image(.spinButton)
                .overlay {
                    VStack(spacing: 0) {
                        Text("bet")
                        Text("\(viewModel.betAmount)")
                    }
                    .font(.multiroundPro(size: 44/Double.delim))
                    .foregroundStyle(.white)
                }
            
            Button {
                viewModel.betAmount += 10
            } label: {
                Image(.incrButton)
                    .overlay {
                        Text("+")
                            .font(.multiroundPro(size: 57/Double.delim))
                            .foregroundStyle(.white)
                    }
            }
            .disabled(viewModel.betAmount >= storage.coinsAmount)
        }
    }
    
    let columns = Array(repeating: GridItem(spacing: -330), count: 5)
    
    var gameBoard: some View {
        ZStack {
            Image(.gameBoard)
            
            LazyVGrid(columns: columns) {
                ForEach(viewModel.enumeratedTiles, id: \.offset) { offset, tile in
                    Tile(imageNamed: tile,
                         isPulsating: viewModel.combinationsTilesIndices.contains(offset))
                }
            }
        }
    }
}

fileprivate struct Tile: View {
    let imageNamed: String
    let isPulsating: Bool
    
    @State private var isAnimating = false
    
    let animation = Animation
                    .easeInOut(duration: 1)
                    .repeatForever(autoreverses: true)
    
    var body: some View {
        Image(imageNamed)
            .shadow(color: .blue,
                    radius: isAnimating ? 30 : 0)
            .scaleEffect(isAnimating ? 1.2 : 1.0)
            .onChange(of: isPulsating) { isPulsating in
                withAnimation(isPulsating ? animation : .default) {
                    isAnimating = isPulsating
                }
            }
    }
}

#Preview {
    GameView()
}
