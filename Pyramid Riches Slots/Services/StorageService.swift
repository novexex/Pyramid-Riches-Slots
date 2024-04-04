
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
}

private extension StorageService {
    enum Keys {
        static let firstLaunch = "firstLaunch"
    }
}
