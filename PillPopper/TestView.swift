//
//  TestView.swift
//  PillPopper
//
//  Created by Kevin Buchholz on 10/23/23.
//

import SwiftUI

struct TestView: View {
    
    @Environment (\.verticalSizeClass) var verticalSizeClass
    
    var days : [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    var body: some View {
        VStack{
            //            Spacer()
            //            Spacer()
            //            Spacer()
            //            Spacer()
            //            Spacer()
            
            ScrollView(.horizontal) {
                
                LazyHStack(alignment: .center, spacing: 15, pinnedViews: /*@START_MENU_TOKEN@*/[]/*@END_MENU_TOKEN@*/, content: {
                    
                    ForEach(1...10, id: \.self) { count in
                        SingleDayRectangle()
                    }

                    .containerRelativeFrame(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/, count: verticalSizeClass == .regular ? 1 : 3, spacing: 15)
                    .scrollTransition { content, phase in content
                            .opacity(phase .isIdentity ? 1.0 : 0.3)
//                            .scaleEffect(x: phase .isIdentity ? 1.0 : 0.3, y: phase .isIdentity ? 1.0 : 0.8)
//                            .offset(y: phase .isIdentity ? 0 : 50)
                    }
                })
                .scrollTargetLayout()
            }
            .contentMargins(30, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
//            .flipsForRightToLeftLayoutDirection(true)
            .environment(\.layoutDirection, .rightToLeft)
            .scrollIndicators(.hidden)
           
            
            
//            Text("Take a pill")
//                .font(.largeTitle)
//                .padding()
            
            RoundedRectangle(cornerRadius: 15)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 200)
            
                        Spacer()
            
        }
    }
}



#Preview {
    TestView()
}
