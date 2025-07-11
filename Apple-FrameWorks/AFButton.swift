//
//  AFButton.swift
//  Apple-FrameWorks
//
//  Created by Hafizur Rahman on 10/7/25.
//

import SwiftUI

struct AFButton: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.medium)
            .frame(width: 280, height: 50)
            .background(Color.pink)
            .foregroundStyle(Color.white)
            .cornerRadius(10)
    }
}

#Preview {
    AFButton(title: "Learn More")
}
