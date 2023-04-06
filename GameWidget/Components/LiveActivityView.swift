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
            Image(context.attributes.homeTeam)
                .teamLogoModifier(frame: 60)
            
            Text("\(context.state.gameState.homeScore)")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.white)
            
            Spacer()
            
            Text("\(context.state.gameState.awayScore)")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.black.opacity(0.75))
            
            Image(context.attributes.awayTeam)
                .teamLogoModifier(frame: 60)
        }
    }
    
    var lastAction: some View {
        HStack {
            Image(context.state.gameState.scoringTeamName)
                .teamLogoModifier(frame: 20)
            
            Text(context.state.gameState.lastAction)
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
    }
}
