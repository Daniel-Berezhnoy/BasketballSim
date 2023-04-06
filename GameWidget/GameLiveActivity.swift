//
//  GameLiveActivity.swift
//  GameWidget
//
//  Created by Daniel Berezhnoy on 4/5/23.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct GameLiveActivity: Widget {
    var body: some WidgetConfiguration {
        
        ActivityConfiguration(for: GameAttributes.self) { context in
            LiveActivityView(context: context)

        } dynamicIsland: { context in
            DynamicIsland {
                
                DynamicIslandExpandedRegion(.leading) { expandedLeadingView }
                DynamicIslandExpandedRegion(.trailing) { expandedTrailingView }
                DynamicIslandExpandedRegion(.bottom) { expandedBottomView }
                
            } compactLeading: {
                compactLeadingView
                
            } compactTrailing: {
                compactTrailingView
                
            } minimal: {
                minimalView
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
    
    var expandedLeadingView: some View {
        HStack {
            Image("warriors")
                .teamLogoModifier(frame: 40)
            
            Text("100")
                .font(.title)
                .fontWeight(.semibold)
        }
    }
    
    var expandedTrailingView: some View {
        HStack {
            Text("88")
                .font(.title)
                .fontWeight(.semibold)
            
            Image("bulls")
                .teamLogoModifier(frame: 40)
        }
    }
    
    var expandedBottomView: some View {
        Label {
            Text("S. Curry drains a 3")
        } icon: {
            Image("warriors")
                .teamLogoModifier(frame: 20)
        }
    }
    
    var compactLeadingView: some View {
        HStack {
            Image("warriors")
                .teamLogoModifier()
            
            Text("137")
                .fontWeight(.semibold)
        }
    }
    
    var compactTrailingView: some View {
        HStack {
            Text("109")
                .fontWeight(.semibold)
            
            Image("bulls")
                .teamLogoModifier()
        }
    }
    
    var minimalView: some View {
        Image("warriors")
            .teamLogoModifier()
    }
}

struct GameLiveActivity_Previews: PreviewProvider {
    
    static let attributes = GameAttributes(homeTeam: "Warriors", awayTeam: "Bulls")
    static let contentState = GameAttributes.ContentState(gameState: GameState(homeScore: 105, awayScore: 96, scoringTeamName: "Warriors", lastAction: "S. Curry drains a 3"))
    
    static var previews: some View {
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.compact))
            .previewDisplayName("Island Compact")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.expanded))
            .previewDisplayName("Island Expanded")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.minimal))
            .previewDisplayName("Minimal")
        attributes
            .previewContext(contentState, viewKind: .content)
            .previewDisplayName("Notification")
    }
}
