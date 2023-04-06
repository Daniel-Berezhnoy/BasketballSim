//
//  GameWidgetBundle.swift
//  GameWidget
//
//  Created by Daniel Berezhnoy on 4/5/23.
//

import WidgetKit
import SwiftUI

@main
struct GameWidgetBundle: WidgetBundle {
    var body: some Widget {
        GameWidget()
        if #available(iOS 16.1, *) {
            GameLiveActivity()
        }
    }
}
