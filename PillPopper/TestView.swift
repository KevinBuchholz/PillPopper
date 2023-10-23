//
//  TestView.swift
//  PillPopper
//
//  Created by Kevin Buchholz on 10/23/23.
//

import SwiftUI


struct TestView: View {
    var body: some View {
        VStack{
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            ScrollView(.horizontal) {
                
                LazyHStack(alignment: .top, spacing: 15, pinnedViews: /*@START_MENU_TOKEN@*/[]/*@END_MENU_TOKEN@*/, content: {
                    
                    ForEach(1...10, id: \.self) { count in
                        RoundedRectangle(cornerRadius: 15)
                            .aspectRatio(1, contentMode: .fit)
//                            .frame(maxWidth: .infinity, maxHeight: 250, alignment: .trailing)
                            .foregroundColor(.pink)
                            .opacity(0.1)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.black, lineWidth: 1)
                                    .opacity(0.2)
                            )
                    }
                })
            }
            .flipsForRightToLeftLayoutDirection(true)
            .environment(\.layoutDirection, .rightToLeft)
            //        .defaultScrollAnchor(.center)
            .scrollIndicators(.hidden)
            
            Text("Take a pill")
                .font(.largeTitle)
                .padding()
            
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
