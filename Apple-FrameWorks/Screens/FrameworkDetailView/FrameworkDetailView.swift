//
//  FrameworkDetailView.swift
//  Apple-FrameWorks
//
//  Created by Hafizur Rahman on 10/7/25.
//

import SwiftUI

struct FrameworkDetailView: View {
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    @Binding var isGrid: Bool
    @State var isShowingSafariView: Bool = false
    
    var body: some View {
        VStack{
            if isGrid {
                XDismissButton(isShowingDetailView: $isShowingDetailView)
            }
                            
            Spacer()
            
            FrameworkTitleView(framework: framework, isGrid: $isGrid)
            
            Text(framework.description).font(.body).padding()
            
            Spacer()
            
            Button{
                isShowingSafariView = true
            }label: {
//                AFButton(title: "Learn More")
                Label("Learn More", systemImage: "book.fill")
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            .tint(.red)
        }.fullScreenCover(isPresented: $isShowingSafariView) {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "https://www.apple.com")!)
        }
    }
}
