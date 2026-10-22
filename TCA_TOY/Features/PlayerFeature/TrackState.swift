//
//  TrackState.swift
//  TCA_TOY
//
//  Created by Taeeun on 10/22/26.
//

import Foundation

struct TrackState: Equatable, Identifiable {
    var id: SessionID
    var volume: Float
    var isMuted: Bool
    var activePatchIDs: Set<UUID>
}
