//
//  LiveActivityView.swift
//  GameWidgetExtension
//
//  Created by Daniel Berezhnoy on 4/5/23.
//

import SwiftUI
import WidgetKit

struct LiveActivityView: View {
    let context: ActivityViewContext<GameAttributes>
    
    var body: some View {
        ZStack {
            background
            
            VStack(spacing: 15) {
                score
                lastAction
            }
            .padding()
        }
    }
    
    var background: some View {
        Image("activity-background")
            .resizable()
        
            .overlay {
                ContainerRelativeShape()
                    .foregroundStyle(.black.gradient)
                    .opacity(0.2)
            }
    }
    
    var score: some View {
        HStack {
            Image("warriors")
                .teamLogoModifier(frame: 60)
            
            Text("105")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.white)
            
            Spacer()
            
            Text("101")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.black.opacity(0.75))
            
            Image("bulls")
                .teamLogoModifier(frame: 60)
        }
    }
    
    var lastAction: some View {
        HStack {
            Image("warriors")
                .teamLogoModifier(frame: 20)
            
            Text("S. Curry drains a 3")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
    }
}

//struct LiveActivityView_Previews: PreviewProvider {
//    static var previews: some View {
//        LiveActivityView()
//            .previewContext(WidgetPreviewContext(family: .systemMedium))
//    }
//}
