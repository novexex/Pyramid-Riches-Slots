
import SwiftUI

extension Font {
    static func inter(size: CGFloat, weight: FontWeight = .regular) -> Font {
        .custom("Inter-" + weight.string, size: size)
    }
    
    static func multiroundPro(size: CGFloat, weight: FontWeight = .regular) -> Font {
        .custom("MultiroundPro" + weight.string, size: size)
    }
    
    static func muller(size: CGFloat, weight: FontWeight = .bold) -> Font {
        .custom("Muller" + weight.string, size: size)
    }
}

extension Font {
    enum FontWeight: String {
        case regular
        case black
        case bold
        case extraBold
        case extraLight
        case light
        case medium
        case semiBold
        case thin
        
        var string: String { rawValue.capitalized }
    }
}
