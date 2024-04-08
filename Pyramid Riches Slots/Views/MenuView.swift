
import SwiftUI

struct MenuView: View {
    @StateObject private var storage = StorageService()
    
    @State private var isSettingsViewPresented = false
    @State private var isGameViewPresented = false
    
    private let levelsAmount = 3
    
    var body: some View {
        ZStack {
            Image(.menuBackground)
                .resizable()
                .ignoresSafeArea()
            
            topUI
                .frame(maxHeight: .infinity,
                       alignment: .top)
            
            levelsScroll
        }
        .navigate(to: InfoView(),
                  when: $isSettingsViewPresented)
        .navigate(to: GameView(),
                  when: $isGameViewPresented)
    }
    
    var topUI: some View {
        GeometryReader { geo in
            HStack(spacing: 15) {
                DailyRewardLabel()
                    .frame(width: geo.size.width / 1.6)
                
                Spacer()
                
                CoinsLabel()
                
                InfoButton {
                    isSettingsViewPresented.toggle()
                }
            }
        }
    }
    
    var levelsScroll: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<levelsAmount, id: \.self) { i in
                    VStack(spacing: 0) {
                        Image("\(i+1)LevelIcon")
                            .padding(.bottom)
                        
                        Button {
                            isGameViewPresented.toggle()
                        } label: {
                            Image(.playButton)
                        }
                        .disabled(!storage.availableLevels.contains(i+1))
                    }
                    .offset(y: 20)
                    .opacity(storage.availableLevels.contains(i+1) ? 1 : 0.3)
                }
            }
            .padding()
        }
    }
}

#Preview {
    MenuView()
}
