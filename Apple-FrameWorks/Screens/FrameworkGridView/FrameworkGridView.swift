//
//  FrameworkGridView.swift
//  Apple-FrameWorks
//
//  Created by Hafizur Rahman on 10/7/25.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @State var isGrid: Bool = true
    @StateObject var viewModel = FrameworkGridViewModel()
    
    
    var body: some View {
        NavigationView {
            (isGrid ?
                    AnyView(
                        ScrollView {
                            LazyVGrid(columns: viewModel.columns) {
                                ForEach(MockData.frameworks) { framework in
                                    FrameworkTitleView(framework: framework, isGrid: $isGrid)
                                        .onTapGesture {
                                            viewModel.selectedFramework = framework
                                        }
                                }
                            }
                            .padding()
                        }
                    )
                    :
                    AnyView(
                        List {
                            ForEach(MockData.frameworks) { framework in
                                NavigationLink(destination: FrameworkDetailView(
                                        framework:framework,
                                        isShowingDetailView:$viewModel.isShowingDetailView,
                                        isGrid: $isGrid
                                    )
                                ) {
                                    FrameworkTitleView(framework: framework, isGrid: $isGrid)
                                }
                                                            }
                        }
                        .listStyle(.plain)
                    )
            )
            .navigationTitle(Text("🍎 Frameworks"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{ isGrid.toggle() }label:{
                        Image(systemName: isGrid ? "square.grid.2x2" : "list.dash")
                    }
                }
            }
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                FrameworkDetailView(
                    framework: viewModel.selectedFramework!,
                    isShowingDetailView: $viewModel.isShowingDetailView,
                    isGrid: $isGrid
                )
            }
        }.tint(Color(.label))
    }
}

#Preview {
    FrameworkGridView()
}


