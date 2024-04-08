
import UIKit

final class AppDelegate: NSObject, UIApplicationDelegate {
    static var supportedInterfaceOrientations = UIInterfaceOrientationMask.landscape
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        AppDelegate.supportedInterfaceOrientations
    }
}
