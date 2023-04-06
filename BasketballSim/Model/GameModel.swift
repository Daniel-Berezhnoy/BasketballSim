//
//  GameModel.swift
//  BasketballSim
//
//  Created by Sean Allen on 11/6/22.
//

import Foundation
import ActivityKit

final class GameModel: ObservableObject, GameSimulatorDelegate {
    
    @Published var gameState = GameState(homeScore: 0,
                                         awayScore: 0,
                                         scoringTeamName: "",
                                         lastAction: "")
    
    let liveActivity: Activity<GameAttributes>? = nil
    let simulator = GameSimulator()
    
    init() {
        simulator.delegate = self
    }
    
    func startLiveActivity() {
        
    }
    
    func didUpdate(gameState: GameState) {
        self.gameState = gameState
    }
    
    func didCompleteGame() {
        
    }
}
