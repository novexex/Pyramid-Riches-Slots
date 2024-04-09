
import SwiftUI

extension View {
    func navigate<NewView: View>(to view: NewView,
                                 when binding: Binding<Bool>,
                                 isNavigationBarHidden: Bool = true,
                                 navigationBarTitle: String = "") -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                NavigationLink(
                    destination: view
                        .navigationBarTitle(navigationBarTitle)
                        .navigationBarHidden(isNavigationBarHidden),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}
