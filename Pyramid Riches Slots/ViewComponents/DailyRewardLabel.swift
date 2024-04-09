
import SwiftUI

struct DailyRewardLabel: View {
    @StateObject private var storage = StorageService.shared
    
    @State private var remainingTime = "23:59"
    
    private let timer = Timer.TimerPublisher(interval: 1,
                                             runLoop: .main,
                                             mode: .common).autoconnect()
    
    var body: some View {
        HStack {
            Image(.dailyRewardIcon)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            ZStack {
                if isDailyBonusAvailable {
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
            if let getRemainingTime {
                remainingTime = getRemainingTime
            }
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
                    if let getRemainingTime {
                        remainingTime = getRemainingTime
                    }
                }
        }
    }
    
    var claimButton: some View {
        Button {
            withAnimation {
                claimDailyBonus()
            }
        } label: {
            Text("Claim")
                .font(.multiroundPro(size: 57/Double.delim))
                .padding(10)
        }
    }
}

extension DailyRewardLabel {
    var isDailyBonusAvailable: Bool {
        guard let lastDailyBonusPick = storage.dailyBonusLastClaimDate else { return true }
        
        let currentDate = Date()
        let calendar = Calendar.current
        
        let components = calendar.dateComponents([.hour], from: lastDailyBonusPick, to: currentDate)
        
        if let hours = components.hour, hours >= 24 {
            return true
        } else {
            return false
        }
    }
    
    var getRemainingTime: String? {
        guard !isDailyBonusAvailable, let lastDailyBonusPick = storage.dailyBonusLastClaimDate else { return nil }
        
        let calendar = Calendar.current
        let now = Date()
        
        let remainingSeconds = calendar.dateComponents([.second],
                                                       from: now,
                                                       to: calendar.date(byAdding: .day,
                                                                         value: 1,
                                                                         to: lastDailyBonusPick)!).second!
        let hours = remainingSeconds / 3600
        let minutes = (remainingSeconds % 3600) / 60
        return String(format: "%02d:%02d", hours, minutes)
    }
    
    func claimDailyBonus() {
        storage.dailyBonusLastClaimDate = Date()
        storage.coinsAmount += 1000
    }
}

#Preview {
    DailyRewardLabel()
}
