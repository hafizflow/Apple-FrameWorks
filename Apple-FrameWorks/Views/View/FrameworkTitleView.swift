//
//  FrameworkTitleView.swift
//  Apple-FrameWorks
//
//  Created by Hafizur Rahman on 11/7/25.
//

import SwiftUI


struct FrameworkTitleView : View {
    let framework: Framework
    @Binding var isGrid: Bool
    
    var body: some View {
        isGrid ?
        
        AnyView(
            VStack{
                Image(framework.imageName)
                    .resizable()
                    .frame(width: 90, height: 90)
                Text(framework.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .scaledToFit()
                    .minimumScaleFactor(0.6)
            }.padding()
        )
        
        :
        
        AnyView(
            HStack(spacing: 30){
                Image(framework.imageName)
                    .resizable()
                    .frame(width: 70, height: 70)
                Text(framework.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .scaledToFit()
                    .minimumScaleFactor(0.6)
            }
        )
    }
}
