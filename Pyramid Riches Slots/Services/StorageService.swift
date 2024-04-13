
import Foundation

final class StorageService: ObservableObject {
    static let shared = StorageService()
    private init() {}
    
    private let userDefaults = UserDefaults.standard
    
    var isFirstLaunch: Bool {
        get {
            userDefaults.object(forKey: Keys.firstLaunch) as? Bool ?? true
        }
        
        set {
            userDefaults.set(newValue, forKey: Keys.firstLaunch)
        }
    }
    
    var coinsAmount: Int {
        get {
            userDefaults.object(forKey: Keys.coinsAmount) as? Int ?? 1000
        }
        
        set {
            userDefaults.set(newValue, forKey: Keys.coinsAmount)
            objectWillChange.send()
        }
    }
    
    var dailyBonusLastClaimDate: Date? {
        get {
            userDefaults.object(forKey: Keys.dailyBonusLastClaimDate) as? Date
        }
        
        set {
            userDefaults.set(newValue, forKey: Keys.dailyBonusLastClaimDate)
            objectWillChange.send()
        }
    }
    
    var availableLevels: [Int] {
        get {
            userDefaults.array(forKey: Keys.availableLevels) as? [Int] ?? [1]
        }
        
        set {
            userDefaults.set(newValue, forKey: Keys.availableLevels)
        }
    }
}

private extension StorageService {
    enum Keys {
        static let firstLaunch = "firstLaunch"
        static let coinsAmount = "coinsAmount"
        static let dailyBonusLastClaimDate = "dailyBonusLastClaimDate"
        static let availableLevels = "availableLevels"
    }
}
