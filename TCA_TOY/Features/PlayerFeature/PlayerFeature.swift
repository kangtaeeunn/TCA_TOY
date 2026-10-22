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
        @Presents var destination: Destination.State?
    }
    
    @Dependency(\.audioClient) var audioClient
    
    enum Action: Equatable {
        case task
        case playPauseTapped
        case seekChanged(time: TimeInterval)
        case volumeChanged(trackID: SessionID, volume: Float)
        case muteTapped(trackID: SessionID)
        case soloTapped(trackID: SessionID)
        case pinDraftStarted(trackID: SessionID)
        case startPointSetTapped(time: TimeInterval)
        case endPointSetTapped(time: TimeInterval)
        case originalSelected(trackID: SessionID, range: ClosedRange<TimeInterval>)
        case songLoaded(Song)
        case loadResponse(duration: TimeInterval)
        case loadFailureResponse(reason: String)
        case patchesChanged
        case recordTapped(SessionID?)
        case recordCancelTapped
        case audioEvent(AudioEvent)
        case countInTicked
        case countInFinished
        case recordingRangeEnded
        case recordingResponse(fileURL: URL)
        case recordingFailureResponse(reason: String)
        case destination(PresentationAction<Destination.Action>)
        enum Alert: Equatable {
            
        }
        
        case delegate(Delegate)
        enum Delegate: Equatable {
            case recordingFinished(target: RecordingTarget, fileURL: URL)
        }
    }
}

extension PlayerFeature {
    @Reducer
    enum Destination {
        case alert(AlertState<PlayerFeature.Action.Alert>)
    }
}
extension PlayerFeature.Destination.State: Equatable {}
extension PlayerFeature.Destination.Action: Equatable {}
