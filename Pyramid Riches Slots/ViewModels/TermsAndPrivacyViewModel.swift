
import SwiftUI
import WebKit

extension TermsAndPrivacyView {
    final class ViewModel: NSObject, WKNavigationDelegate, ObservableObject {
        @Published var canGoBack = false
        @Published var canGoForward = false
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            canGoBack = webView.canGoBack
            canGoForward = webView.canGoForward
        }
    }
}
