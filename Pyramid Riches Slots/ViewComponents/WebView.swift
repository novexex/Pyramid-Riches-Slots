
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    private let webView = WKWebView()
    
    let urlString: String
    
    init(urlString: String, 
         delegate: WKNavigationDelegate?) {
        self.urlString = urlString
        webView.navigationDelegate = delegate
    }
    
    private var request: URLRequest? {
        guard let url = URL(string: urlString) else { return nil }
        return URLRequest(url: url)
    }

    func makeUIView(context: Context) -> WKWebView { webView }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let request else { return }
        uiView.load(request)
    }
    
    func goBack() {
        webView.goBack()
    }
    
    func goForward() {
        webView.goForward()
    }
        
    func goHome() {
        guard let request else { return }
        webView.load(request)
    }
    
    func reload() {
        webView.reload()
    }
}
