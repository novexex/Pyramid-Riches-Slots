
import SwiftUI
import StoreKit

struct InfoView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Image(.gameBackground)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                BackButton(dismiss: dismiss)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                
                scrollView
            }
            .padding(.top)
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
    
    var scrollView: some View {
        VStack {
            ZStack {
                Image(.infoBackground)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(alignment: .topLeading) {
                        Text("Main")
                            .font(.muller(size: 45/Double.delim, weight: .medium))
                            .offset(x: 25, y: 5)
                    }
                
                VStack(spacing: 0) {
                    Button {
                        
                    } label: {
                        HStack {
                            Image(.writeIcon)
                            
                            Text("Write us")
                                .font(.muller(size: 40/Double.delim, weight: .bold))
                                .foregroundStyle(.white)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    
                    Button {
                        requestReview()
                    } label: {
                        HStack {
                            Image(.rateIcon)
                            
                            Text("Rate us")
                                .font(.muller(size: 40/Double.delim, weight: .bold))
                                .foregroundStyle(.white)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                .offset(y: 10)
            }
            .padding(.horizontal)
            
            ZStack {
                Image(.infoBackground)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(alignment: .topLeading) {
                        Text("Rules")
                            .font(.muller(size: 45/Double.delim, weight: .medium))
                            .offset(x: 25, y: 5)
                    }
                
                VStack(spacing: 0) {
                    Button {
                        
                    } label: {
                        HStack {
                            Image(.infoIcon)
                            
                            Text("Privacy Policy")
                                .font(.muller(size: 40/Double.delim, weight: .bold))
                                .foregroundStyle(.white)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Image(.infoIcon)
                            
                            Text("Terms of use")
                                .font(.muller(size: 40/Double.delim, weight: .bold))
                                .foregroundStyle(.white)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                .offset(y: 12)
                
            }
            .padding(.horizontal)
            .padding(.top)
        }
    }
    
    func requestReview() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            DispatchQueue.main.async {
                SKStoreReviewController.requestReview(in: scene)
            }
        }
    }
}

#Preview {
    InfoView()
}
