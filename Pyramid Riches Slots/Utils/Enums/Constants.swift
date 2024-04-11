
import SwiftUI

enum Constants {
    static let notificationsTitle = "Allow notifications about bonuses and promos".uppercased()
    static let notificationsSubtitle = "Stay tuned with best offers from our casino"
    static let notificationsAcceptButton = "Yes, I Want Bonuses!"
    static let notificationsSkipButton = "Skip"
    
    static let delim = 2.7
    
    static let coinsGradient = LinearGradient(
        stops: [
            Gradient.Stop(color: Color(red: 1, green: 0.97, blue: 0.67), location: 0.03),
            Gradient.Stop(color: Color(red: 1, green: 0.78, blue: 0), location: 0.17),
            Gradient.Stop(color: Color(red: 1, green: 0.93, blue: 0.6), location: 0.45),
            Gradient.Stop(color: Color(red: 0.87, green: 0.72, blue: 0.03), location: 0.61),
            Gradient.Stop(color: Color(red: 0.67, green: 0.42, blue: 0.04), location: 0.92),
        ],
        startPoint: UnitPoint(x: 0.51, y: -0.46),
        endPoint: UnitPoint(x: 0.51, y: 1.78)
    )
    
    static let redGradient = LinearGradient(
        stops: [
            Gradient.Stop(color: Color(red: 0.25, green: 0, blue: 0), location: 0.00),
            Gradient.Stop(color: Color(red: 0.74, green: 0.03, blue: 0.03), location: 0.52),
            Gradient.Stop(color: Color(red: 0.3, green: 0, blue: 0), location: 1.00),
        ],
        startPoint: UnitPoint(x: 0.5, y: 0),
        endPoint: UnitPoint(x: 0.5, y: 1)
    )
    
    static let privacyLink = "https://pyramidrichesslots.com/privacy-policy.html"
    static let termsLink = "https://pyramidrichesslots.com/privacy-policy.html"
    static let writeUsLink = "https://pyramidrichesslots.com/support.html"
}
