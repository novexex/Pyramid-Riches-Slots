
import SwiftUI

@main
struct PyramidRichesSlotsApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    private let notificationsService = NotificationsService()
    
    var body: some Scene {
        WindowGroup {
            if notificationsService.isNotificationsAuthorized {
                MenuView()
            } else {
                NotificationsView()
            }
        }
    }
}
