//
//  FrameworkDetailViewModel.swift
//  Apple-FrameWorks
//
//  Created by Hafizur Rahman on 10/7/25.
//

import SwiftUI

final class FrameworkDetailViewModel: ObservableObject {
    var selectedFramework: Framework?{
        didSet{
            isShowingDetailView = true
        }
    }
    
    @Published var isShowingDetailView: Bool = false
}
