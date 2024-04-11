
import Foundation

extension Int {
    var descriptionWithSpaces: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        formatter.groupingSize = 3

        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
