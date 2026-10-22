//
//  RecordingTarget.swift
//  TCA_TOY
//
//  Created by Taeeun on 10/22/26.
//

import Foundation

struct RecordingTarget: Equatable {
    var pinID: UUID
    var range: ClosedRange<TimeInterval>
    var sessionID: SessionID
}
