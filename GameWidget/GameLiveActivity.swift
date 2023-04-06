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
                
                DynamicIslandExpandedRegion(.leading) {
                    HStack {
                        Image(context.attributes.homeTeam)
                            .teamLogoModifier(frame: 40)
                        
                        Text("\(context.state.gameState.homeScore)")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                
                DynamicIslandExpandedRegion(.trailing) {
                    HStack {
                        Text("\(context.state.gameState.awayScore)")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Image(context.attributes.awayTeam)
                            .teamLogoModifier(frame: 40)
                    }
                }
                
                DynamicIslandExpandedRegion(.bottom) {
                    Label {
                        Text(context.state.gameState.lastAction)
                    } icon: {
                        Image(context.state.gameState.scoringTeamName)
                            .teamLogoModifier(frame: 20)
                    }
                }
                
            } compactLeading: {
                HStack {
                    Image(context.attributes.homeTeam)
                        .teamLogoModifier()
                    
                    Text("\(context.state.gameState.homeScore)")
                        .fontWeight(.semibold)
                }
                
            } compactTrailing: {
                HStack {
                    Text("\(context.state.gameState.awayScore)")
                        .fontWeight(.semibold)
                    
                    Image(context.attributes.awayTeam)
                        .teamLogoModifier()
                }
                
            } minimal: {
                Image(context.state.gameState.winningTeamName)
                    .teamLogoModifier()
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
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
