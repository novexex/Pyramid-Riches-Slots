
import UserNotifications

protocol NotificationsAvailablilityProtocol {
    var isNotificationsAuthorized: Bool { get }
}

protocol NotificationsRequestProtocol {
    func requestNotificationsAccess(completion: @escaping () -> ())
}

final class NotificationsService: NotificationsAvailablilityProtocol, NotificationsRequestProtocol {
    let center: UNUserNotificationCenter
    var isNotificationsAuthorized: Bool
    
    init(center: UNUserNotificationCenter = .current()) {
        self.center = center
        self.isNotificationsAuthorized = false
        center.getNotificationSettings { [weak self] settings in
            switch settings.authorizationStatus {
            case .notDetermined, .denied:
                self?.isNotificationsAuthorized = false
            case .authorized, .provisional, .ephemeral:
                self?.isNotificationsAuthorized = true
            @unknown default:
                self?.isNotificationsAuthorized = false
            }
        }
    }
    
    func requestNotificationsAccess(completion: @escaping () -> ()) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Notification access granted.")
            } else {
                print("Notification access denied.")
            }
            completion()
        }
    }
}
