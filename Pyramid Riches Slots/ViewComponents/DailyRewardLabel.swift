
import SwiftUI

struct DailyRewardLabel: View {
    @StateObject private var viewModel = ViewModel()
    
    @State private var remainingTime = ""
    
    private let timer = Timer.TimerPublisher(interval: 1,
                                             runLoop: .main,
                                             mode: .common).autoconnect()
    
    var body: some View {
        HStack {
            Image(.dailyRewardIcon)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            ZStack {
                if viewModel.isDailyBonusAvailable {
                    claimButton
                } else {
                    timerView
                }
            }
            .foregroundStyle(.white)
            .padding(.horizontal)
            .background {
                RoundedRectangle(cornerRadius: 111)
                    .foregroundStyle(Constants.redGradient)
                    .overlay {
                        RoundedRectangle(cornerRadius: 111)
                            .stroke(Constants.coinsGradient,
                                    lineWidth: 5)
                    }
            }
        }
        .onAppear {
            remainingTime = viewModel.remainingTime
        }
    }
    
    var timerView: some View {
        HStack {
            Image(.alarmIcon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 30)
                .padding(.vertical, 6)
            
            Text(remainingTime)
                .font(.multiroundPro(size: 57/Double.delim))
                .onReceive(timer) { _ in
                    remainingTime = viewModel.remainingTime
                }
        }
    }
    
    var claimButton: some View {
        Button {
            viewModel.claimDailyBonus()
        } label: {
            Text("Claim")
                .font(.multiroundPro(size: 57/Double.delim))
        }
    }
}

#Preview {
    DailyRewardLabel()
}
