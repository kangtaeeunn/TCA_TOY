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
    
    @ObservableState
    struct State: Equatable {
        var tracks: IdentifiedArrayOf<TrackState> = []
        var loadPhase: LoadPhase = .idle
        var isPlaying: Bool = false
        var playbackRate: Float = 1.0
        var loopRange: ClosedRange<TimeInterval>?
        var soloTrackID: SessionID?
        var recordingPhase: RecordingPhase = .idle
        var recordingTarget: RecordingTarget?
        @Presents var destination: Destination?
    }
    
    @Dependency(\.audioClient) var audioClient
}
