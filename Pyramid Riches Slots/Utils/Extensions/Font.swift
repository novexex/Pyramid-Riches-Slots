
import SwiftUI

extension Font {
//    static func khula(size: CGFloat, weight: Font.Weight = .regular) -> Font {
//        .custom("Khula-" + getWeightName(weight), size: size)
//    }
    
    static private func getWeightName(_ weight: Font.Weight) -> String {
        switch weight {
        case .medium: "Medium"
        case .regular: "Regular"
        case .ultraLight: "ExtraLight"
        case .light: "Light"
        case .semibold: "SemiBold"
        case .bold: "Bold"
        default: ""
        }
    }
}
