//
//  GameLiveActivity.swift
//  GameWidget
//
//  Created by Daniel Berezhnoy on 4/5/23.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct GameAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var gameState: GameState
    }

    // Fixed non-changing properties about your activity go here!
    var homeTeam: String
    var awayTeam: String
}

struct GameLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: GameAttributes.self) { context in
            LiveActivityView()

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom")
                    // more content
                }
                
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Center")
                }
                
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T")
            } minimal: {
                Text("Min")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

struct GameLiveActivity_Previews: PreviewProvider {
    
    static let attributes = GameAttributes(homeTeam: "Warriors", awayTeam: "Bulls")
    static let contentState = GameAttributes.ContentState(gameState: GameState(homeScore: 105,
                                                                               awayScore: 96,
                                                                               scoringTeamName: "Warriors",
                                                                               lastAction: "S. Curry drains a 3"))
    
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
