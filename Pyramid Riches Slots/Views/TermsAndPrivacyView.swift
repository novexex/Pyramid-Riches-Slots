
import SwiftUI

struct TermsAndPrivacyView: View {
    let webView: WebView
    let isControlPanelShowed: Bool
    @StateObject private var viewModel: ViewModel
    
    init(urlString: String, isControlPanelShowed: Bool = false) {
        let wrappedViewModel = ViewModel()
        _viewModel = StateObject(wrappedValue: wrappedViewModel)
        webView = WebView(urlString: urlString,
                          delegate: wrappedViewModel)
        self.isControlPanelShowed = isControlPanelShowed
    }
    
    var body: some View {
        VStack(spacing: 0) {
            webView
            
            if isControlPanelShowed {
                controlPanel
            }
        }
    }
    
    var controlPanel: some View {
        HStack(spacing: 30) {
            Spacer()
            
            Button {
                webView.goBack()
            } label: {
                Image(systemName: "chevron.left")
            }
            .disabled(!viewModel.canGoBack)
            
            Spacer()
            
            Button {
                webView.goForward()
            } label: {
                Image(systemName: "chevron.right")
            }
            .disabled(!viewModel.canGoForward)
            
            Spacer()
            
            Button {
                webView.goHome()
            } label: {
                Image(systemName: "house")
            }
            
            Spacer()
            
            Button {
                webView.reload()
            } label: {
                Image(systemName: "arrow.clockwise")
            }
            Spacer()
        }
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .background {
            Rectangle()
                .fill(.ultraThickMaterial)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    TermsAndPrivacyView(urlString: "https://google.com")
}
