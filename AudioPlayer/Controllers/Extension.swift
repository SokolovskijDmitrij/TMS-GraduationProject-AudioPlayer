//
//  Extension.swift
//  AudioPlayer
//
//  Created by Дмитрий Соколовский on 18.07.22.
//

import Foundation
import UIKit

//MARK: - String
extension String {
    
    var durationToInt: Int {
        if self.isEmpty { return 0 } //Just in case we get empty value
        let comp = self.components(separatedBy: ":")
        let min = Int(comp[0])
        let sec = Int(comp[1])
        return ((min ?? 0) * 60) + (sec ?? 0)
    }
    
    var stripped: String {
        let nolAllowedChars = Set("\\/")
        return self.filter { !nolAllowedChars.contains($0) }
    }
}
//MARK: - Double
extension Double {
    func parsedTimeDuration() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        guard let formattedString = formatter.string(from: self) else { return "" }
        return formattedString
    }
}

//MARK: - Int
extension Int {
    
    var toAudioString: String {
        let h = self / 3600
        let m = (self % 3600) / 60
        let s = (self % 3600) % 60
        return h > 0 ? String(format: "%1d:%02d:%02d", h, m, s) : String(format: "%1d:%02d", m, s)
    }
}

