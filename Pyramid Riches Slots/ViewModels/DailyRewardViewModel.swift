
import SwiftUI

extension DailyRewardLabel {
    final class ViewModel: ObservableObject {
        @ObservedObject private var storage = StorageService()
        
        var isDailyBonusAvailable: Bool {
            guard let lastDailyBonusPick = storage.dailyBonusLastClaimDate else { return true }
            
            print(lastDailyBonusPick)
            
            let currentDate = Date()
            let calendar = Calendar.current
            
            let components = calendar.dateComponents([.hour], from: lastDailyBonusPick, to: currentDate)
            
            if let hours = components.hour, hours >= 24 {
                return true
            } else {
                return false
            }
        }
        
        var remainingTime: String {
            guard !isDailyBonusAvailable, let lastDailyBonusPick = storage.dailyBonusLastClaimDate else { return "" }
            
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
        }
    }
}
