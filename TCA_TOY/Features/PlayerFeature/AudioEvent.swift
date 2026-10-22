//
//  AudioEvent.swift
//  TCA_TOY
//
//  Created by Taeeun on 10/22/26.
//

enum AudioEvent: Equatable {
    case loopWrapped
    case playbackEnded
    case recordingFailed(reason: String)
    case interrupted
}
