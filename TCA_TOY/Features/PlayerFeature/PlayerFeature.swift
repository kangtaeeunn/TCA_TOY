//
//  PlayerFeature.swift
//  TCA_TOY
//
//  Created by Taeeun on 10/22/26.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct PlayerFeature {
    enum RecordingPhase: Equatable {
        case idle
        case countIn(beat: Int)
        case recording
        case finishing
    }
    
    enum LoadPhase: Equatable {
        case idle
        case loading
        case ready
        case failed(reason: String)
    }
    
    enum Destination: Equatable {
        case alert(AlertState<Action>)
    }
}
