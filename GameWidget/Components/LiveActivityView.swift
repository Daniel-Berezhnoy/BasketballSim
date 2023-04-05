//
//  LiveActivityView.swift
//  GameWidgetExtension
//
//  Created by Daniel Berezhnoy on 4/5/23.
//

import SwiftUI
import WidgetKit

struct LiveActivityView: View {
    var body: some View {
        ZStack {
            Image("activity-background")
                .resizable()
            
            Text("Hello, World!")
        }
    }
}

struct LiveActivityView_Previews: PreviewProvider {
    static var previews: some View {
        LiveActivityView()
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
