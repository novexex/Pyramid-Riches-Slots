
import SwiftUI

extension Text {
    func stroke(color: Color, width: CGFloat) -> some View {
        modifier(StrokeModifier(strokeSize: width, strokeColor: color))
    }
}

fileprivate struct StrokeModifier: ViewModifier {
    private let id = UUID()
    let strokeSize: CGFloat
    let strokeColor: Color
    
    func body(content: Content) -> some View {
        appliedStrokeBackground(content: content)
    }
    
    private func appliedStrokeBackground(content: Content) -> some View {
        content
            .padding(strokeSize * 2)
            .background(
                Rectangle()
                    .foregroundColor(strokeColor)
                    .mask(alignment: .center) {
                        mask(content: content)
                    }
            )
    }
    
    func mask(content: Content) -> some View {
        Canvas { context, size in
            context.addFilter(.alphaThreshold(min: 0.01))
            context.drawLayer {
                if let resolvedView = context.resolveSymbol(id: id) {
                    $0.draw(resolvedView, at: .init(x: size.width / 2,
                                                    y: size.height / 2))
                }
            }
        } symbols: {
            content
                .tag(id)
                .blur(radius: strokeSize)
        }
    }
}
